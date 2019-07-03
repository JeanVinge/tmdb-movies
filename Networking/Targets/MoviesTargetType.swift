//
//  TestTargetType.swift
//  Networking
//
//  Created by jean.vinge on 17/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import Keys

public enum MoviesTargetType {
    case movies(page: Int)
    case genreList
}

extension MoviesTargetType: TargetType {
    public var path: String {
        switch self {
        case .movies:
            return "movie/upcoming"
        case .genreList:
            return "genre/movie/list"
        }
    }
    public var method: Method {
        return .get
    }
    public var task: Task {
        switch self {
        case .movies(let page):
            return .requestParameters(parameters: ["api_key": TmdbMoviesKeys().tMDbMoviesAPIKey,
                                                   "page": page,
                                                   "language": Locale.preferredLanguages[0]],
                                      encoding: URLEncoding.default)
        case .genreList:
            return .requestParameters(parameters: ["api_key": TmdbMoviesKeys().tMDbMoviesAPIKey,
                                                   "language": Locale.preferredLanguages[0]],
                                      encoding: URLEncoding.default)
        }
    }
}
