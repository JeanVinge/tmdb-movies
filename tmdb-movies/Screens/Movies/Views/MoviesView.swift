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
import Resources

class MoviesView: View<MoviesViewModel> {

    // MARK: Var

    lazy var searchBar: UISearchBar = UISearchBar(ViewStyle<UISearchBar> {
        $0.barTintColor = .kinoGray
        $0.tintColor = .white
        $0.barStyle = .black
        $0.searchBarStyle = .minimal
        $0.placeholder = L10n.General.search
        $0.keyboardType = .asciiCapable
        $0.autocapitalizationType = .none
    })
    lazy var collectionView = CollectionView(RefreshControl())
    lazy var builder: RxCollectionCellBuilder<Movies, MovieCell> = {
        return RxCollectionCellBuilder<Movies, MovieCell>(collectionView, cellSize: MovieSize.cardSize)
    }()

    // MARK: Init

    override func initSubviews() {
        addSubview(collectionView)
        addSubview(searchBar)
        collectionView.backgroundColor = .clear
        collectionView.keyboardDismissMode = .onDrag
        collectionView.initializeIndicatorView()
    }
    override func initConstraints() {
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(safeAreaLayoutGuide.snp.topMargin).inset(60)
            make.left.equalTo(safeAreaLayoutGuide.snp.left)
            make.right.equalTo(safeAreaLayoutGuide.snp.right)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottomMargin)
        }
        searchBar.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
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

        let searchTrigger = searchBar
            .rx
            .text
            .map { $0 ?? "" }
            .asDriverJustComplete

        let refreshTrigger = refreshControl
            .rx
            .controlEvent(.valueChanged)
            .asDriverJustComplete

        let pagination = collectionView
            .rx
            .paginate
            .mapToVoid
            .asDriverJustComplete

        let openDetail = collectionView
            .rx
            .modelSelected(Movie.self)
            .asDriver()

        let triggerMerged = Driver<Void>
            .merge([state.viewDidLoad,
                    loadingView
                        .rx
                        .tryAgain])

        return viewModel
            .transform(input: MoviesViewModel
                .Input(trigger: triggerMerged,
                       pullRefresh: refreshTrigger,
                       paginate: pagination,
                       openDetail: openDetail,
                       filter: searchTrigger))
    }

    func bindOutput(_ output: MoviesViewModel.Output,
                    refreshControl: UIRefreshControl) {
        output.movies
            .map { _ in false }
            .drive(refreshControl
                .rx
                .isRefreshing)
            .disposed(by: rx.disposeBag)
        output.movies
            .drive(collectionView
                .rx
                .items(dataSource: builder.dataSource))
            .disposed(by: rx.disposeBag)
        output.hasNextPage
            .drive(collectionView
                .rx
                .shouldEnabledInfiniteScroll)
            .disposed(by: rx.disposeBag)
        output.movies
            .map { _ in true }
            .drive(collectionView
                .rx
                .finishScroll)
            .disposed(by: rx.disposeBag)
        output
            .openDetail
            .drive()
            .disposed(by: rx.disposeBag)
        output
            .trackActivity
            .drive(rx.changeState)
            .disposed(by: rx.disposeBag)
        output
            .canPullRefresh
            .drive(collectionView
                .rx
                .disableRefresh)
            .disposed(by: rx.disposeBag)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.collectionViewLayout.invalidateLayout()
    }
}
