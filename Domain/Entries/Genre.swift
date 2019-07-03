//
//  Genre.swift
//  Domain
//
//  Created by jean.vinge on 21/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

public struct Genre: Codable {
    public var id: Int
    public var name: String
}

extension Genre: Equatable {
    public static func == (lhs: Genre,
                           rhs: Genre) -> Bool {
        return lhs.id == rhs.id &&
                lhs.name == rhs.name
    }
}

public struct GenreList: Codable {
    public var genres: [Genre]
    public init() {
        genres = []
    }
}

extension GenreList: Equatable {
    public static func == (lhs: GenreList,
                           rhs: GenreList) -> Bool {
        return lhs.genres == rhs.genres
    }
}
