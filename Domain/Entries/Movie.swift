//
//  QueryResult.swift
//  Domain
//
//  Created by jean.vinge on 18/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

public struct Movie: Codable {

    enum CodingKeys: String, CodingKey {
        case isAdult = "adult"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case isVideo = "video"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case popularity
    }

    var isAdult: Bool
    var id: String
    var originalLanguage: String
    var originalTitle: String
    var overview: String
    var posterPath: String
    var releaseDate: String
    var title: String
    var isVideo: Bool
    var voteAverage: Double
    var voteCount: Int
    var popularity: Double
}
