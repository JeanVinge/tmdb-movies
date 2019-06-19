//
//  TestTargetType.swift
//  Networking
//
//  Created by jean.vinge on 17/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import RxSwift
import Keys

public enum MoviesTargetType {
    case movies(page: Int)
}

extension MoviesTargetType: TargetType {
    public var path: String {
        switch self {
        case .movies:
            return "movie/66/similar"
        }
    }
    public var method: Method {
        return .get
    }
    public var task: Task {
        switch self {
        case .movies(let page):
            return .requestParameters(parameters: ["api_key": TmdbMoviesKeys().tMDbMoviesAPIKey,
                                                   "page": page],
                                      encoding: URLEncoding.default)
        }
    }
}
