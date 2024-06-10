//
//  APIClientType.swift
//  smart-tasks
//
//  Created by Rashid Khan on 09/06/2024.
//

import Foundation
import Alamofire

public typealias HttpMethod = HTTPMethod

enum URLRequestType: Int, Hashable {
    case json
    case formData
}

protocol APIRouteType: URLConvertible {
    var baseURL: URL { get }
    var method: HttpMethod { get set }
    var type: URLRequestType { get set }
    var url: String { get set }
    var pathVariables: [String]? { get set }
    var query: [String: String]? { get set }
    var headers: [String: String] { get set }
    var body: Data? { get set }
}

protocol APIClientType {
    func request<T: Decodable>(route: APIRouteType, completion: @escaping (T)->Void)
}

class APIClient: APIClientType {
    private var session: Alamofire.Session
    
    init(session: Alamofire.Session) {
        self.session = session
    }
    
    func request<T: Decodable>(route: APIRouteType, completion: @escaping (T) -> Void) {
        self.session.request(route).validate().responseData { [weak self] response in
            guard let self = self else { return }
            
            
        }
    }
}

// MARK: - Private Members
fileprivate struct APIResponse: Decodable {
    let code: Int
    let data: Data

    init(code: Int, data: Data) {
        self.code = code
        self.data = data
    }
}

