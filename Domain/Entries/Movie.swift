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
        case genreIds = "genre_ids"
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

    public var isAdult: Bool
    public var genreIds: [Int]
    public var id: Int
    public var originalLanguage: String
    public var originalTitle: String
    public var overview: String
    var posterPath: String?
    var releaseDate: String
    public var title: String
    public var isVideo: Bool
    public var voteAverage: Double
    public var voteCount: Int
    public var popularity: Double
    public var genres: [Genre]?

    func getDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        return dateFormatter.date(from: releaseDate) // replace Date String
    }

    public var releaseFullDate: String {
        let dateformatter = DateFormatter()
        dateformatter.dateStyle = .full
        dateformatter.timeStyle = .none
        return dateformatter.string(from: getDate() ?? Date())
    }

    public var genreDescription: String {
        return genres?
            .map { $0.name }
            .joined(separator: ", ") ?? ""
    }

    public var poster: URL? {
        return URL(string: Configuration.imageBaseURL.appending(posterPath ?? ""))
    }

    public init() {
        self.isAdult = false
        self.id = 0
        self.originalLanguage = ""
        self.originalTitle = ""
        self.overview = ""
        self.posterPath = ""
        self.releaseDate = ""
        self.title = ""
        self.isVideo = false
        self.voteAverage = 0
        self.voteCount = 0
        self.popularity = 0
        self.genres = []
        self.genreIds = []
    }
}
