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

public struct GenreList: Codable {
    public var genres: [Genre]
}
