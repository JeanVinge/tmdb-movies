//
//  TableView.swift
//  Utility
//
//  Created by jean.vinge on 22/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import UIKit

open class TableView: UITableView, ConfigurableView {

    public var refresh: RefreshControl

    public init(_ backgroundColor: UIColor = .clear,
                refreshControl: RefreshControl = RefreshControl()) {
        self.refresh = refreshControl
        super.init(frame: .zero, style: .plain)
        self.backgroundColor = backgroundColor
        self.separatorStyle = .none
        self.separatorInset = .zero
        self.separatorColor = .clear

        self.estimatedRowHeight = 1
        self.contentInset = .zero
    }

    public required init?(coder aDecoder: NSCoder) {
        self.refresh = RefreshControl()
        super.init(coder: aDecoder)
        initLayout()
    }

    public func setupRefreshControl() {
        self.refreshControl = self.refresh
    }

    open func initSubviews() {
        self.backgroundColor = .clear
    }

    open func initConstraints() {

    }
}
