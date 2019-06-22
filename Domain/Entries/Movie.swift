//
//  QueryResult.swift
//  Domain
//
//  Created by jean.vinge on 18/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

public struct Movie: Codable {

    enum CodingKeys: String, CodingKey {
        case genreIds = "genre_ids"
        case id
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
    }

    public var genreIds: [Int]
    public var id: Int
    public var overview: String
    var posterPath: String?
    var releaseDate: String
    public var title: String
    public var genres: [Genre]?

    func getDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        return dateFormatter.date(from: releaseDate)
    }

    public var releaseFullDate: String {
        let dateformatter = DateFormatter()
        dateformatter.dateStyle = .long
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
        self.id = 0
        self.overview = ""
        self.posterPath = ""
        self.releaseDate = ""
        self.title = ""
        self.genres = []
        self.genreIds = []
    }
}
