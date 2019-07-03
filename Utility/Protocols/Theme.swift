//
//  Theme.swift
//  Utility
//
//  Created by Jean Vinge on 18/06/2018.
//  Copyright © 2018 Jean Vinge. All rights reserved.
//

import UIKit

public struct ViewTheme {
    public let backgroundColor: UIColor
    public let tintColor: UIColor
    public let statusBarStyle: UIStatusBarStyle

    public init(backgroundColor: UIColor,
                tintColor: UIColor,
                statusBarStyle: UIStatusBarStyle) {
        self.backgroundColor = backgroundColor
        self.tintColor = tintColor
        self.statusBarStyle = statusBarStyle
    }
}

public struct NavigationTheme {
    public var background: UIColor
    public var titleColor: UIColor
    public var tintColor: UIColor
    public var font: UIFont
    public var prefersLargeTitles: Bool

    public init(background: UIColor,
                titleColor: UIColor,
                tintColor: UIColor,
                font: UIFont,
                prefersLargeTitles: Bool) {
        self.background = background
        self.titleColor = titleColor
        self.tintColor = tintColor
        self.font = font
        self.prefersLargeTitles = prefersLargeTitles
    }
}

public struct TabBarTheme {
    public var tintColor: UIColor
    public var barTintColor: UIColor
    public var isTranslucent: Bool
    public var unSelectedColor: UIColor

    public init(tintColor: UIColor,
                barTintColor: UIColor,
                isTranslucent: Bool,
                unSelectedColor: UIColor) {
        self.tintColor = tintColor
        self.barTintColor = barTintColor
        self.isTranslucent = isTranslucent
        self.unSelectedColor = unSelectedColor
    }
}

public protocol Theme {
    var navigationBar: NavigationTheme { get }
    var tabBar: TabBarTheme { get }
    var view: ViewTheme { get }
}

extension Theme {
    public var tabBar: TabBarTheme {
        return TabBarTheme(tintColor: .gray,
                           barTintColor: .black,
                           isTranslucent: false,
                           unSelectedColor: .gray)
    }
}
