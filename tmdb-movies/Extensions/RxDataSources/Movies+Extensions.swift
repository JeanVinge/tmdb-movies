//
//  QueryResult+Extensions.swift
//  tmdb-movies
//
//  Created by jean.vinge on 21/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import RxDataSources
import Domain

extension Movie: IdentifiableType, Equatable {
    public typealias Identity = Int

    public var identity: Int {
        return id
    }
}

public func == (lhs: Movie, rhs: Movie) -> Bool {
    return lhs.id == rhs.id
}

extension QueryResult: IdentifiableType where T == Movie {
    public typealias Identity = String
}

extension QueryResult: SectionModelType where T == Movie {}

extension QueryResult: AnimatableSectionModelType where T == Movie {

    public var items: [Movie] {
        return results
    }

    public typealias Item = Movie

    public var identity: String {
        return "\(page)"
    }

    public init(original: Movies, items: [Movie]) {
        self = original
        results = items
    }
}
