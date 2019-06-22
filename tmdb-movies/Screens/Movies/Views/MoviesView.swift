//
//  TestView.swift
//  tmdb-movies
//
//  Created by jean.vinge on 14/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import Utility
import RxSwift
import RxCocoa
import RxDataSources
import Domain

class MoviesView: View<MoviesViewModel> {

    // MARK: Var

    lazy var collectionView = CollectionView(RefreshControl())
    lazy var builder: RxCollectionCellBuilder<Movies, MovieCell> = {
        return RxCollectionCellBuilder<Movies, MovieCell>(collectionView)
    }()

    // MARK: Init

    override func initSubviews() {
        addSubview(collectionView)
        collectionView.backgroundColor = .clear
        collectionView.initializeIndicatorView()
    }
    override func initConstraints() {
        collectionView.snp.makeConstraints { (make) in
            make.top.left.right.bottom.equalToSuperview()
        }
    }

    override func bindViewModel() {
        guard let state = state,
            let refreshControl = collectionView.refreshControl,
            let viewModel = viewModel
            else { return }
        bindOutput(bindInput(state,
                             refreshControl: refreshControl,
                             viewModel: viewModel),
                   refreshControl: refreshControl)
    }

    func bindInput(_ state: Stateable,
                   refreshControl: UIRefreshControl,
                   viewModel: MoviesViewModel) -> MoviesViewModel.Output {
        let viewDidLoad = state
            .viewDidAppear
            .mapToVoid
            .asDriver()

        let refreshTrigger = refreshControl
            .rx
            .controlEvent(.valueChanged)
            .asDriverJustComplete

        let mergedTrigger = Driver<Void>
            .merge([viewDidLoad,
                    refreshTrigger])

        let pagination = collectionView
            .rx
            .paginate
            .flatMap { _ -> Driver<Int> in
                return .just(MoviesRepository.shared.currentPage) }.asDriverJustComplete

        let openDetail = collectionView
            .rx
            .modelSelected(Movie.self)
            .asDriver()

        return viewModel
            .transform(input: MoviesViewModel
            .Input(trigger: mergedTrigger,
                   paginate: pagination,
                   openDetail: openDetail))
    }

    func bindOutput(_ output: MoviesViewModel.Output,
                    refreshControl: UIRefreshControl) {
        output.movies
            .map { _ in false }
            .drive(refreshControl.rx.isRefreshing)
            .disposed(by: rx.disposeBag)
        output.movies
            .drive(collectionView.rx
                .items(dataSource: builder.dataSource))
            .disposed(by: rx.disposeBag)
        output.movies
            .map { _ in MoviesRepository.shared.hasNextPage }
            .drive(collectionView.rx.shouldEnabledInfiniteScroll)
            .disposed(by: rx.disposeBag)
        output.movies
            .map { _ in true }
            .drive(collectionView.rx.finishScroll)
            .disposed(by: rx.disposeBag)
        output
            .openDetail
            .drive()
            .disposed(by: rx.disposeBag)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.invalidateIntrinsicContentSize()
    }
}
