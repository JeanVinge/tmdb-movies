//
//  ViewController.swift
//  Utility
//
//  Created by jean.vinge on 14/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import UIKit

open class ViewController: UIViewController {

    // MARK: Var

    public var theme: Theme

    override open var preferredStatusBarStyle: UIStatusBarStyle {
        return theme.view.statusBarStyle
    }

    // MARK: Init

    public init<View: UIView & BindableView>(_ view: View,
                                             router: Router? = nil,
                                             theme: Theme) {
        self.theme = theme
        super.init(nibName: nil,
                   bundle: nil)
        self.view = view
        view.setup(StateableViewController(self),
                   router: router == nil ? ScreenRouter(self) : router)
        view.bindViewModel()
        view.layoutIfNeeded()
        configureTheme(theme)
        navigationController?.navigationBar.configure(theme: theme)
    }

    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureTheme(theme)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init coder not implemented")
    }

    open override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        view.setNeedsUpdateConstraints()
        view.frame = UIScreen.main.bounds
    }
}
