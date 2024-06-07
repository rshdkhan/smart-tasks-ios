//
//  ResultType.swift
//  smart-tasks
//
//  Created by Rashid Khan on 07/06/2024.
//

import Foundation

enum ResultType<T>{
    
    case success(T)
    case cancel
    
    public var isCancel: Bool {
        if case ResultType.cancel = self {
            return true
        }
        return false
    }
    
    public var isSuccess: T? {
        guard !isCancel else { return nil }
        if case let ResultType.success(value) = self {
            return value
        }
        return nil
    }

}
