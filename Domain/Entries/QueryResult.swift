//
//  DataResult.swift
//  Domain
//
//  Created by jean.vinge on 18/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

public typealias Movies = QueryResult<Movie>

public struct QueryResult<T: Codable>: Codable {

    enum CodingKeys: String, CodingKey {
        case pages = "total_pages"
        case result
        case page
    }

    var page: Int
    var result: [T]
    var pages: Int
}
