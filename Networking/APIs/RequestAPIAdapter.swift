//
//  RequestAPIAdapter.swift
//  Networking
//
//  Created by jean.vinge on 18/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

struct RequestAPIAdapter: RequestAdapter {

    // MARK: Var

    var targetType: TargetType

    // MARK: Init

    init(_ targetType: TargetType) {
        self.targetType = targetType
    }

    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        switch self.targetType.task {
        case .requestParameters(let parameters, let encoding):
            return try encoding.encode(urlRequest, with: parameters)
        }
    }

    func request() throws -> URLRequest {
        return try self.adapt(try URLRequest(url: targetType.baseURL.appendingPathComponent(targetType.path),
                                             method: targetType.method,
                                             headers: targetType.headers))
    }
}
