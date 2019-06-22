//
//  Service.swift
//  Coordinator
//
//  Created by Jean Vinge on 17/01/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import RxSwift

public final class Request {

    // MARK: Var

    public var session: URLSession
    public var task: URLSessionDataTask?

    // MARK: Init

    public init(_ session: URLSession = SessionManager.session) {
        self.session = session
    }

    func request(_ targetType: TargetType) -> Single<Response> {
        return makeRequest(targetType)
    }

    private func makeRequest(_ targetType: TargetType) -> Single<Response> {
        return Single<Response>.create { observer in
            do {
                let completion = { (data: Data?,
                    response: URLResponse?,
                    error: Error?) in
                    observer(.success(Response(data,
                                               response: response,
                                               task: self.task,
                                               error: error)))
                }
                self.task = try self.session.request(targetType,
                                             completion: completion)
                self.task?.resume()
            } catch let error {
                observer(.error(error))
            }
            return Disposables.create {
                self.task?.cancel()
                self.task = nil
            }
        }
    }
}
