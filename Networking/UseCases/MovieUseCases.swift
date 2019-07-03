//
//  MovieUseCases.swift
//  Networking
//
//  Created by jean.vinge on 19/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import Domain
import RxSwift

public struct MovieUseCases: Domain.MovieUseCases {

    public init() {
    }

    public func movies(_ page: Int) -> Single<Movies> {
        return Request().request(MoviesTargetType.genreList).map(GenreList.self).flatMap { list in
            return Request().request(MoviesTargetType.movies(page: page)).map(Movies.self).flatMap { movies in
                return .just(self.transform(movies,
                                       genreList: list))
            }
        }
    }

    public func transform(_ movies: Movies, genreList: GenreList) -> Movies {
        var mMovies = movies
        mMovies.results = movies.results.compactMap { movie in
            var mMovie = movie
            mMovie.genres = genreList.genres.filter { genre in movie.genreIds.filter { $0 == genre.id }.count > 0 }
            return mMovie
        }
        return mMovies
    }
}
