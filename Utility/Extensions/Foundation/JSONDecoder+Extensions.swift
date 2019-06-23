//
//  JSONDecoder+Extensions.swift
//  Utility
//
//  Created by Jean Vinge on 28/12/18.
//  Copyright © 2018 Jean Vinge. All rights reserved.
//

import Foundation

public extension JSONDecoder {
    static func decode<T: Decodable>(_ classObj: T.Type, from JSON: Any) throws -> T {
        return try JSONDecoder.decode(classObj.self,
                                      from: try JSONSerialization.data(
                                        withJSONObject: JSON, options: []))
    }

    static func decode<T: Decodable>(_ classObj: T.Type = T.self,
                                     from mock: MockFile,
                                     bundle: Bundle = Bundle.main) throws -> T {
        return try JSONDecoder().decode(classObj.self,
                                        from: Data(mock, bundle: bundle))
    }
}
