//
//  GenericView.swift
//  Utility
//
//  Created by jean.vinge on 20/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import UIKit

open class GenericView: UIView, ConfigurableView {

    public required init() {
        super.init(frame: .zero)
        initLayout()
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        initLayout()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initLayout()
    }

    open func initSubviews() {

    }

    open func initConstraints() {

    }
}
