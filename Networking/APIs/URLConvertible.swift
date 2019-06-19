//
//  URLConvertible.swift
//  Networking
//
//  Created by jean.vinge on 17/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

public protocol URLConvertible {
    func asURL() throws -> URL
}

extension String: URLConvertible {
    public func asURL() throws -> URL {
        guard let url = URL(string: self) else { throw APIErrors.invalidURL(url: self) }
        return url
    }
}

extension URL: URLConvertible {
    public func asURL() throws -> URL { return self }
}

extension URLComponents: URLConvertible {
    public func asURL() throws -> URL {
        guard let url = url else { throw APIErrors.invalidURL(url: self) }
        return url
    }
}

public protocol URLRequestConvertible {
    func asURLRequest() throws -> URLRequest
}

extension URLRequestConvertible {
    public var urlRequest: URLRequest? { return try? asURLRequest() }
}

extension URLRequest: URLRequestConvertible {
    public func asURLRequest() throws -> URLRequest { return self }
}

extension URLRequest {
    public init(url: URLConvertible, method: Method,
                headers: HTTPHeaders? = nil) throws {
        let url = try url.asURL()
        self.init(url: url)
        httpMethod = method.rawMethod
        if let headers = headers {
            for (headerField, headerValue) in headers {
                setValue(headerValue, forHTTPHeaderField: headerField)
            }
        }
    }

    func adapt(using adapter: RequestAdapter?) throws -> URLRequest {
        guard let adapter = adapter else { return self }
        return try adapter.adapt(self)
    }
}

public protocol RequestAdapter {
    func adapt(_ urlRequest: URLRequest) throws -> URLRequest
}
