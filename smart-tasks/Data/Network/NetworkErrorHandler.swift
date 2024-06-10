//
//  NetworkErrorHandler.swift
//  smart-tasks
//
//  Created by Rashid Khan on 10/06/2024.
//

import Foundation

public enum NetworkErrors: LocalizedError {
    case noInternet
    case requestTimedOut
    case badGateway
    case notFound
    case forbidden
    case internalServerError(InternalServerError?)
    case serverError(Int, String)
    case authError(AuthError?)
    case existingEmiratesID
    case unknown
    case parsing

    public struct InternalServerError: Codable {
        public let status: String
        public let messages: [Message]
        
        enum CodingKeys: String, CodingKey {
            case status
            case messages
        }

        public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            status = ((try? values.decodeIfPresent(String.self, forKey: .status)) ?? "") 
            if let message = try? values.decodeIfPresent(Message.self, forKey: .messages) {
                self.messages = [message]
            } else {
                self.messages = (try? values.decodeIfPresent([Message].self, forKey: .messages) ?? []) ?? []
            }
        }
            
        public struct Message: Codable {
            public let errorCode: Int
            public let errorMessage: String
            
            enum CodingKeys: String, CodingKey {
                case errorCode = "error_code"
                case errorMessage = "error_message"
            }
            public init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                errorCode = (try? values.decodeIfPresent(Int.self, forKey: .errorCode) ?? 0) ?? 0
                errorMessage = (try? values.decodeIfPresent(String.self, forKey: .errorMessage) ?? "") ?? ""
            }
        }
    }

    public struct AuthError: Codable {
        public let error: AuthErrorDetail
        
        public struct AuthErrorDetail: Codable {
            public let code: String
            public let message: String
        }
    }
}

extension NetworkErrors {
    public var errorDescription: String? { // ToDo
        switch self {
        case .noInternet: return "Looks like you're offline. Please reconnect and refresh to continue using App."
        case .requestTimedOut: return "The request is timeout!"
        case .badGateway: return "Bad Gateway"
        case .notFound: return "Resource Not Found"
        case .forbidden: return "You don't have access to this information"
        case .internalServerError(let serverErrors): // Done
            if let error = serverErrors?.messages.first { return error.errorMessage }
            else { return "Sorry, that doesn't look right." }
        case .serverError(_, let message): return message
        case .authError(let authError):
            if let authError = authError { return authError.error.message }
            else { return "Sorry, that doesn't look right." }
        default: return "Looks like you're offline. Please reconnect and refresh to continue using App."
        }
    }
    
    public var errorCode: Int? { // ToDo
        switch self {
        case .noInternet: return nil
        case .requestTimedOut: return nil
        case .badGateway: return nil
        case .notFound: return nil
        case .forbidden: return nil
        case .internalServerError(let serverErrors): // Done
            if let error = serverErrors?.messages.first { return error.errorCode }
            else { return nil }
        case .serverError(_, let message): return nil
        case .authError(let authError): return nil
        default: return nil
        }
    }
}

class NetworkErrorHandler {

    static func decode<T: Codable>(data: Data) throws -> T {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }

    static func mapError(_ code: Int, data: Data) -> NetworkErrors {
        switch code {
        case 401:
            let authError: NetworkErrors.AuthError? = try? decode(data: data)
                return .authError(authError)
        case 403:
            return .forbidden
        case 404:
            return .notFound
        case 400...499:
            let serverErrors: NetworkErrors.InternalServerError? = try? decode(data: data)
            return .internalServerError(serverErrors)
        case 502:
            return .badGateway
        case -1009:
            return .noInternet
        case -1001:
            return .requestTimedOut
        case 1041:
            return .existingEmiratesID
        default:
            return .unknown
        }
    }
}
