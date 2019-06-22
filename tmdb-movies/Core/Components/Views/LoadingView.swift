//
//  LoadingView.swift
//  tmdb-movies
//
//  Created by jean.vinge on 22/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import Utility
import RxSwift
import RxCocoa

class LoadingView: GenericView {

    enum State {
        case loading
        case error
        case closed
    }

    // MARK: Var

    lazy var backgroundView: UIView = UIView(ViewStyle<UIView> {
        $0.backgroundColor = .clear
    })

    lazy var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView(ViewStyle<UIActivityIndicatorView> {
        $0.style = .whiteLarge
    })

    lazy var messageView = MessageView()

    // MARK: Init

    override func initSubviews() {
        addSubview(backgroundView)
        addSubview(activityIndicator)
        addSubview(messageView)
    }

    override func initConstraints() {
        backgroundView.snp.makeConstraints { (make) in
            make.top.left.right.bottom.equalToSuperview()
        }
        activityIndicator.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        messageView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }

    func changeState(_ state: State) {
        show(state)
    }

    func show(_ state: State) {
        let isHidden = state == .loading ? true : false
        let isUserInteractionEnabled = state == .loading ? false : true
        messageView.isHidden = isHidden
        messageView.isUserInteractionEnabled = isUserInteractionEnabled
        activityIndicator.isHidden = !isHidden
        _ = state == .loading ? activityIndicator.startAnimating() : activityIndicator.stopAnimating()
    }
}

protocol LoadableView {
    var loadingView: LoadingView { get }
    func startLoading()
    func stopLoading()
    func error()
}

var mainLoader = LoadingView()

extension GenericView: LoadableView {
    var loadingView: LoadingView {
        return mainLoader
    }
    func startLoading() {
        addSubview(loadingView)
        loadingView.snp.makeConstraints { (make) in
            make.top.left.right.bottom.equalToSuperview()
        }
        loadingView
            .changeState(.loading)
    }
    func stopLoading() {
        loadingView
            .changeState(.closed)
        loadingView.removeFromSuperview()
    }
    func error() {
        loadingView
            .changeState(.error)
    }
}

extension Reactive where Base: GenericView {
    var tryAgain: Driver<Void> {
        return base.loadingView.messageView.button.rx.tap.asDriver()
    }
    var changeState: Binder<LoadingView.State> {
        return Binder<LoadingView.State>(self.base, binding: { (base, state) in
            switch state {
            case .closed:
                base.stopLoading()
            case .error:
                base.error()
            case .loading:
                base.startLoading()
            }
        })
    }
}
