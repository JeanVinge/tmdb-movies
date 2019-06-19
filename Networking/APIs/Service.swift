//
//  Service.swift
//  Coordinator
//
//  Created by Jean Vinge on 17/01/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

public class Service {

    // MARK: Var

    public var session: URLSession

    // MARK: Init

    public init(_ session: URLSession = SessionManager.session) {
        self.session = session
    }
}
