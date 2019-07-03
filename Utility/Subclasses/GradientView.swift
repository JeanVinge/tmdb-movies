//
//  GradientView.swift
//  Utility
//
//  Created by jean.vinge on 22/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import UIKit

open class GradientView: GenericView {

    // MARK: Var

    lazy var gradient: CAGradientLayer = CAGradientLayer()

    // MARK: Init

    open func setup(_ colors: [UIColor]) {
        gradient.setup(colors)
    }

    open override func layoutSubviews() {
        super.layoutSubviews()
        gradient.frame = bounds
        layer.insertSublayer(gradient, at: 0)
    }
}
