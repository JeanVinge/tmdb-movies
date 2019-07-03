//
//  CAGradientLayer+Extensions.swift
//  Utility
//
//  Created by jean.vinge on 22/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import UIKit

public extension CAGradientLayer {
    convenience init(_ colors: [UIColor]) {
        self.init()
        setup(colors)
    }
    func setup(_ colors: [UIColor]) {
        self.colors = colors.map { $0.cgColor }
    }
}
