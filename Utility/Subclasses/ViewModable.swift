//
//  View.swift
//  Utility
//
//  Created by jean.vinge on 14/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import UIKit

open class View<VM: ViewModel>: ViewTransformable {

    // MARK: Var

    public typealias ViewModelType = VM

    public var viewModel: VM?
    public var state: Stateable?

    // MARK: Init

    public required init(_ viewModel: ViewModelType) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        initLayout()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initLayout()
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        initLayout()
    }

    public required init() {
        super.init()
        initLayout()
    }

    public func setup(_ state: Stateable,
                      router: Router?) {
        self.state = state
        self.viewModel?.router = router
    }

    open override func initSubviews() {}
    open override func initConstraints() {}
    open func bindViewModel() {}
}
