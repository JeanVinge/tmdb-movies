//
//  ViewController.swift
//  Utility
//
//  Created by jean.vinge on 14/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import UIKit
import RxSwift

public typealias ConcreteView = UIView & BindableView

open class ViewController: UIViewController {

    // MARK: Var

    private var baseView: ConcreteView
    private var theme: Theme
    private lazy var state: StateableViewController = {
        return StateableViewController(self)
    }()

    override open var preferredStatusBarStyle: UIStatusBarStyle {
        return theme.view.statusBarStyle
    }

    // MARK: Init

    public init<View: ConcreteView>(_ view: View,
                                    router: Router? = nil,
                                    theme: Theme) {
        self.theme = theme
        self.baseView = view
        super.init(nibName: nil,
                   bundle: nil)
        view.setup(StateableViewController(self),
                   router: router == nil ? ScreenRouter(self) : router)
        view.bindViewModel()
    }

    open override func loadView() {
        super.loadView()
        self.view = baseView
    }

    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureTheme(theme)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init coder not implemented")
    }
}
