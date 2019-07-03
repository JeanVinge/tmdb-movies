//
//  URLSession+Extensions.swift
//  Networking
//
//  Created by jean.vinge on 18/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

public typealias RequestCompletion = (Data?, URLResponse?, Error?) -> Void

public extension URLSession {
    func request(_ targetType: TargetType,
                 completion: @escaping RequestCompletion) throws -> URLSessionDataTask {
        return dataTask(with: try RequestAPIAdapter(targetType).request(), completionHandler: completion)
    }
}
