//
//  Method.swift
//  Networking
//
//  Created by jean.vinge on 15/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

public enum Method: String {
    case post
    case put
    case get
    case delete
    case patch
    case head
}

extension Method {
    var rawMethod: String {
        return self.rawValue.uppercased()
    }
}
