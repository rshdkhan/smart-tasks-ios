//
//  APIRouteType.swift
//  smart-tasks
//
//  Created by Rashid Khan on 10/06/2024.
//

import Foundation
import Alamofire
 
typealias HttpMethod = HTTPMethod

protocol APIRouteType: URLRequestConvertible {
    var baseURL: URL { get }
    var method: HttpMethod { get set }
    var type: URLRequestType { get set }
    var url: String { get set }
    var pathVariables: [String]? { get set }
    var query: [String: String]? { get set }
    var headers: [String: String] { get set }
    var body: Data? { get set }
}

enum URLRequestType: Int, Hashable {
    case json
}
