//
//  TestView.swift
//  tmdb-movies
//
//  Created by jean.vinge on 14/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import Utility
import SnapKit
import NSObject_Rx
import Networking
import RxSwift
import Domain

class TestView: View<TestViewModel> {

    lazy var backgroundView = UIView(ViewStyle<UIView> {
        $0.backgroundColor = .blue
    })

    lazy var titleLabel = UILabel(ViewStyle<UILabel> {
        $0.textColor = .white
    })

    override func initSubviews() {
        addSubview(backgroundView)
        addSubview(titleLabel)
    }
    override func initConstraints() {
        backgroundView.snp.makeConstraints { (make) in
            make.top.left.right.bottom.equalToSuperview()
        }
        titleLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }

    override func bindViewModel() {
        guard let state = state, let viewModel = viewModel else { return }
        let output = viewModel.transform(input:
            TestViewModel.Input(title: state.viewDidAppear.mapToVoid))
        output.title.drive(titleLabel.rx.text).disposed(by: self.rx.disposeBag)

        TestTarget.make().subscribe(onSuccess: { (result) in
            print("result \(result)")
        }, onError: { error in
            print("error \(error)")
        }).disposed(by: self.rx.disposeBag)
    }
}


struct TestTarget {
    static func make() -> Single<Movies> {
        let session = Service().session
        return session.rx.request(MoviesTargetType.movies(page: 1)).flatMap({ result -> Single<Result<Movies, Error>> in
            let rr = result.map(Movies)
            return .just(rr)
        })
    }
}
