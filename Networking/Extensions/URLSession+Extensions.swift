//
//  URLSession+Extensions.swift
//  Networking
//
//  Created by jean.vinge on 18/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import RxSwift

public typealias RequestCompletion = (Data?, URLResponse?, Error?) -> Void

public extension Reactive where Base: URLSession {

    func request(_ targetType: TargetType) -> Single<JSONConvertable.Success> {
        return makeRequest(targetType).flatMap { .just(JSONConvertable($0).convert) }
    }

    private func makeRequest(_ targetType: TargetType) -> Single<Response> {
        return Single<Response>.create { observer in
            var task: URLSessionDataTask?
            do {
                let completion = { (data: Data?,
                    response: URLResponse?,
                    error: Error?) in
                    observer(.success(Response(data,
                                               response: response,
                                               task: task,
                                               error: error)))
                }
                task = try self.base.request(targetType,
                                             completion: completion)
                task?.resume()
            } catch let error {
                observer(.error(error))
            }
            return Disposables.create {
                task?.cancel()
                task = nil
            }
        }
    }
}

public extension URLSession {
    func request(_ targetType: TargetType,
                 completion: @escaping RequestCompletion) throws -> URLSessionDataTask {
        return dataTask(with: try RequestAPIAdapter(targetType).request(), completionHandler: completion)
    }
}
