//
//  MovieCell.swift
//  tmdb-moviesTests
//
//  Created by jean.vinge on 24/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

@testable import tmdb_movies

import XCTest

class MovieCellTests: XCTestCase {

    var view = MovieCell()

    func test_if_is_in_on_screen() {
        XCTAssertTrue(view.imageView.isDescendant(of: view))
        XCTAssertTrue(view.genreView.isDescendant(of: view))
        XCTAssertTrue(view.titleLabel.isDescendant(of: view))
        XCTAssertTrue(view.releaseDataView.isDescendant(of: view))
    }

}
