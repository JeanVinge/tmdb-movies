//
//  TargetType.swift
//  Networking
//
//  Created by jean.vinge on 15/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import Foundation

public protocol TargetType {
    var baseURL: URL { get }
    var path: String { get }
    var method: Method { get }
    var task: Task { get }
    var headers: HTTPHeaders? { get }
}

extension TargetType {
    public var baseURL: URL {
        do {
            return try Configuration.baseAPI.asURL()
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
    public var headers: HTTPHeaders? {
        return nil
    }
}

public enum Task {
    case requestParameters(parameters: Parameters,
        encoding: ParameterEncoding)
}
