//
//  MockMovieUseCases.swift
//  NetworkingTests
//
//  Created by jean.vinge on 23/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import Foundation
import RxSwift
import Domain
import Utility

@testable import Networking

private class EmptyClass {}

var bundle: Bundle {
    return Bundle(for: EmptyClass.self)
}

enum MoviesMock: String, MockFile {
    case movies
    case genres
}

struct MockMoviesUseCases: Domain.MovieUseCases {

    var mock: RequestCase

    init(_ mock: RequestCase) {
        self.mock = mock
    }
    func movies(_ page: Int) -> Single<Movies> {
        switch mock {
        case .success:
            guard let movies = try? JSONDecoder.decode(Movies.self,
                                                       from: MoviesMock.movies,
                                                       bundle: bundle) else { fatalError() }
            return .just(movies)
        case .failure:
            return .error(APIErrors.unknowError)
        }
    }

    func transform(_ movies: Movies, genreList: GenreList) -> Movies {
        return MovieUseCases()
            .transform(movies,
                       genreList: genreList)
    }
}
