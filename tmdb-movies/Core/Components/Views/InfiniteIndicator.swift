//
//  InfiniteIndicator.swift
//  Utility
//
//  Created by jean.vinge on 21/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import UIKit
import Utility
import Resources

final class InfiniteIndicator: GenericView {

    // MARK: Var

    lazy var activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.style = .white
        view.hidesWhenStopped = true
        return view
    }()

    lazy var loadingLabel = UILabel(ViewStyle<UILabel> {
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.text = L10n.General.loading
    })

    private lazy var containerView = UIView(ViewStyle<UIView> {
        $0.backgroundColor = .clear
    })

    private var animating = false

    // MARK: Init

    override func initSubviews() {
        addSubview(containerView)
        containerView.addSubview(activityIndicator)
        containerView.addSubview(loadingLabel)
    }

    override func initConstraints() {
        containerView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        activityIndicator.snp.makeConstraints { (make) in
            make.left.top.bottom.equalToSuperview()
        }
        loadingLabel.snp.makeConstraints { (make) in
            make.left.equalTo(activityIndicator.snp.right).offset(5)
            make.top.bottom.right.equalToSuperview()
        }
    }

    override func didMoveToWindow() {
        super.didMoveToWindow()
        if window != nil {
            restartAnimationIfNeeded()
        }
    }

    func customize(textColor: UIColor, style: UIActivityIndicatorView.Style) {
        self.loadingLabel.textColor = textColor
        self.activityIndicator.style = style
    }

    // MARK: - Private

    @objc func restartAnimationIfNeeded() {
        self.activityIndicator.stopAnimating()
        if animating {
            self.activityIndicator.startAnimating()
        }
    }

    // MARK: - Public

    func isAnimating() -> Bool {
        return animating
    }

    @objc func startAnimating() {
        if animating {
            return
        }
        animating = true
        self.activityIndicator.startAnimating()
    }

    @objc func stopAnimating() {
        if !animating {
            return
        }
        animating = false
        self.activityIndicator.stopAnimating()
    }
}

extension CollectionView {
    func initializeIndicatorView() {
        infiniteScrollIndicatorView = InfiniteIndicator(frame: CGRect(x: 0, y: 0, width: 24, height: 50))
    }
}
