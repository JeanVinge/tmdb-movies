//
//  SessionManager.swift
//  Networking
//
//  Created by jean.vinge on 16/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

public struct SessionManager {

    // MARK: Var

    private static let timeoutInterval: TimeInterval = 15
    private static var config: URLSessionConfiguration = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = timeoutInterval
        configuration.timeoutIntervalForResource = timeoutInterval
        configuration.requestCachePolicy = .useProtocolCachePolicy
        return configuration
    }()

    public static var session: URLSession = {
        return URLSession(configuration: config)
    }()
}
