//
//  UIColor+Extensions.swift
//  Utility
//
//  Created by Jean Vinge on 18/06/2018.
//  Copyright © 2018 Jean Vinge. All rights reserved.
//

import UIKit

extension UIColor {

    // MARK: - Initialization

    convenience init(rgb red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1) {
        self.init(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
    open class var systemBlue: UIColor {
        return UIColor(rgb: 74, green: 144, blue: 226)
    }
    open class var random: UIColor {
        return UIColor(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1)
    }
}
