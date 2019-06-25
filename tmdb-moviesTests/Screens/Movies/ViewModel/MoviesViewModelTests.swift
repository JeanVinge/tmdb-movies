//
//  MoviesViewModelTests.swift
//  tmdb-moviesTests
//
//  Created by jean.vinge on 24/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

@testable import tmdb_movies

//import NetworkingTests
import XCTest
import RxSwift
import RxCocoa
import RxTest
import RxBlocking
import Domain

class MoviesViewModelTests: XCTestCase {

//    var fakeUseCases = MockMoviesUseCases(.success)
//    var viewModel: MoviesViewModel?
//
//    private func createInput(trigger: Driver<Void>,
//                             pullRefresh: Driver<Void>,
//                             paginate: Driver<Void>,
//                             openDetail: Driver<Movie>,
//                             filter: Driver<String>) -> MoviesViewModel.Input {
//        return MoviesViewModel.Input(trigger: trigger,
//                                     pullRefresh: pullRefresh,
//                                     paginate: paginate,
//                                     openDetail: openDetail,
//                                     filter: filter)
//    }
//
//    var disposeBag: DisposeBag!
//
//    override func setUp() {
//        disposeBag = DisposeBag()
//        viewModel = MoviesViewModel(fakeUseCases)
//    }
//
//    override func tearDown() {
//        disposeBag = nil
//        viewModel = nil
//    }
//
//    func test_transform_List_with_success() {
//
//        let trigger = PublishSubject<Void>()
//        let pullRefresh = PublishSubject<Void>()
//        let paginate = PublishSubject<Void>()
//        let openDetail = PublishSubject<Movie>()
//        let filter = PublishSubject<String>()
//
//        let input = createInput(trigger: trigger.asDriverJustComplete,
//                                pullRefresh: pullRefresh.asDriverJustComplete,
//                                paginate: paginate.asDriverJustComplete,
//                                openDetail: openDetail.asDriverJustComplete,
//                                filter: filter.asDriverJustComplete)
//        let output = viewModel?.transform(input: input)
//
//        output?.canPullRefresh.drive().disposed(by: self.disposeBag)
//        output?.hasNextPage.drive().disposed(by: self.disposeBag)
//        output?.movies.drive().disposed(by: self.disposeBag)
//        output?.openDetail.drive().disposed(by: self.disposeBag)
//        output?.trackActivity.drive().disposed(by: self.disposeBag)
//
//        trigger.onNext(())
//
//        do {
//            let list = try output?.movies.toBlocking().first()?.first?.items ?? []
//            let hasNextPage = try output?.hasNextPage.toBlocking().first()
//            XCTAssertTrue(hasNextPage ?? false)
//            XCTAssert(list.count > 0)
//
//            if let movie = list.first {
//                openDetail.onNext(movie)
//            } else {
//                XCTFail("movie list can't be nil")
//            }
//        } catch {
//            XCTFail("could not load movie list")
//        }
//    }
}
