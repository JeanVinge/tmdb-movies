//
//  Test.swift
//  NetworkingTests
//
//  Created by jean.vinge on 23/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import XCTest
import RxSwift
import RxBlocking
import Utility
import Domain

@testable import Networking

class MovieUseCasesTests: XCTestCase {

    var mockUseCase: MockMoviesUseCases?
    let genreList = try? JSONDecoder.decode(GenreList.self,
                                            from: MoviesMock.genres,
                                            bundle: bundle)

    override func setUp() {
        mockUseCase = MockMoviesUseCases(.success)
    }

    func test_success() {
        let movies = try? mockUseCase?
            .movies(1)
            .toBlocking()
            .single()
        XCTAssertNotNil(movies)
    }

    func test_transform() {
        let movies = try? mockUseCase?
            .movies(1)
            .toBlocking()
            .single()
        let combined = mockUseCase?
            .transform(movies ?? Movies(),
                       genreList: genreList ?? GenreList())
        let originalGenre = movies?.results.compactMap { $0.genreIds }.flatMap { $0 }
        let combinedGenre = combined?.results.compactMap { $0.genres }.flatMap { $0 }
        XCTAssertEqual(originalGenre?.count,
                       combinedGenre?.count)
    }
}
