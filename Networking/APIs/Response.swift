//
//  Response.swift
//  Networking
//
//  Created by jean.vinge on 18/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

public struct Response {

    var data: Data
    var response: HTTPURLResponse
    var task: URLSessionDataTask?
    var error: Error?

    init(_ data: Data?,
         response: URLResponse?,
         task: URLSessionDataTask?,
         error: Error?) {
        self.data = data ?? Data()
        self.response = response as? HTTPURLResponse ?? HTTPURLResponse()
        self.task = task
        self.error = error
    }
}

extension Response {
    func handleStatusCode() throws -> Response {
        if let error = error {
            throw APIErrors.undefinied(error)
        }
        switch response.statusCode {
        case 200...299:
            return self
        case 400...499:
            guard let apiErr = APIErrors.ClientError(rawValue: response.statusCode) else { throw APIErrors.unknowError }
            throw APIErrors.clientError(clientError: apiErr)
        case 500...599:
            guard let apiErr = APIErrors.ServerError(rawValue: response.statusCode) else { throw APIErrors.unknowError }
            throw APIErrors.serverError(server: apiErr)
        default:
            throw APIErrors.statusCode(self)
        }
    }
}

public typealias APIResult<T> = Result<T, Error>

public protocol ResponseConvertable {
    associatedtype Success
    var response: Response { get }
    var convert: Success { get }
}

public struct JSONConvertable: ResponseConvertable {

    public typealias Success = Result<Any, Error>

    public var response: Response

    public var convert: Result<Any, Error> {
        do {
            return .success(try response.handleStatusCode())
        } catch let error {
            return .failure(error)
        }
    }

    init(_ response: Response) {
        self.response = response
    }
}
