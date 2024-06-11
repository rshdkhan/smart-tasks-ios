//
//  RouteT.swift
//  smart-tasks
//
//  Created by Rashid Khan on 10/06/2024.
//

import Foundation

fileprivate let BASE_URL = URL(string: "http://demo1414406.mockable.io/")!

struct SmartTasksAPIRoute: APIRouteType {
    var baseURL: URL
    var method: HttpMethod
    var type: URLRequestType
    var url: String
    var pathVariables: [String]?
    var query: [String: String]?
    var headers: [String: String] = [:] // Default Header
    var body: Data? = nil // Default Body
    
    init(baseURL: URL = BASE_URL,
         method: HttpMethod = .get,
         type: URLRequestType = .json,
         url: String = "",
         pathVariables: [String]? = nil,
         query: [String: String]? = nil,
         headers: [String: String] = [:]) {
        
        self.baseURL = baseURL
        self.method = method
        self.type = type
        self.url = url
        self.pathVariables = pathVariables
        self.query = query
        for (key, value) in headers {
            self.headers [key] = value
        }
    }
}

extension SmartTasksAPIRoute {
    func asURLRequest() throws -> URLRequest {

        let url = try constructAPIUrl()
        
        var urlRequest = URLRequest(url: url)

        urlRequest.httpMethod = method.rawValue

        var requestTypeHeaders: [String: String] {
            switch type {
                case .json: return ["Content-Type": "application/json", "Accept": "application/json"]
            }
        }
        
        for (key, value) in requestTypeHeaders {
            urlRequest.setValue(value, forHTTPHeaderField: key)
        }

        for (key, value) in headers {
            urlRequest.setValue(value, forHTTPHeaderField: key)
        }

        urlRequest.httpBody = self.body

        return urlRequest
    }

    private func constructAPIUrl() throws -> URL {

        var constructedURL = baseURL.appendingPathComponent(url)

        if let pathVariables = pathVariables {
            for pathVariable in pathVariables {
                constructedURL.appendPathComponent(pathVariable)
            }
        }

        if let query = query {
            var components = URLComponents(string: constructedURL.absoluteString)!
            var queryItems = [URLQueryItem]()
            for (key, value) in query {
                let item = URLQueryItem(name: key, value: value)
                queryItems.append(item)
            }
            components.queryItems = queryItems
            return components.url!
        }

        return constructedURL
    }
}
