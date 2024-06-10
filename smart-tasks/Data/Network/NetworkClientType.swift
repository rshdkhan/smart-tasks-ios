//
//  APIClientType.swift
//  smart-tasks
//
//  Created by Rashid Khan on 09/06/2024.
//

import Foundation
import Alamofire

protocol APIClientType {
    func request<T: Decodable>(route: APIRouteType, completion: @escaping (Result<T, NetworkErrors>)->Void)
}

class APIClient: APIClientType {
    private var session: Alamofire.Session
    
    init(session: Alamofire.Session) {
        self.session = session
    }
    
    func request<T: Decodable>(route: APIRouteType, completion: @escaping (Result<T, NetworkErrors>)->Void) {
        session.request(route).validate(statusCode: 200..<400).responseData { [weak self] response in
            guard let self = self else { return }
            
            switch response.result {
            case .success(let data):
                do {
                    let object: T = try self.decode(data: data)
                    completion(.success(object))
                } catch {
                    completion(.failure(.parsing))
                }
                
            case .failure(let error):
                let code = (error as NSError).code
                let data = response.data ?? Data()
                let error = NetworkErrorHandler.mapError(code, data: data)
                completion(.failure(error))
            }
        }
    }
}

fileprivate extension APIClient {
    var serverReadableDateTimeFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        return formatter
    }
    
    func decode<T: Decodable>(data: Data) throws -> T {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(serverReadableDateTimeFormatter)
        let result = try decoder.decode(T.self, from: data)
        return result
    }
}
