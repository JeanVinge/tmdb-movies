//
//  UINavigationBar+Extensions.swift
//  Utility
//
//  Created by Jean Vinge on 19/09/2018.
//  Copyright © 2018 Jean Vinge. All rights reserved.
//

import UIKit

extension UIApplication {
    var statusBarView: UIView? {
        return value(forKey: "statusBar") as? UIView
    }
}

extension UINavigationBar {
    func configure(theme: Theme) {
        UIApplication.shared.statusBarView?.backgroundColor = theme.navigationBar.background
        let isTranslucent = theme.navigationBar.background == .clear ? true : false
        self.barTintColor = theme.navigationBar.background
        self.backgroundColor = theme.navigationBar.background
        self.isTranslucent = isTranslucent
        self.tintColor = theme.navigationBar.tintColor
        self.prefersLargeTitles = theme.navigationBar.prefersLargeTitles
        self.largeTitleTextAttributes = [.foregroundColor: theme.navigationBar.titleColor,
                                         .backgroundColor: theme.navigationBar.background]
        self.titleTextAttributes = [.foregroundColor: theme.navigationBar.titleColor,
                                    .font: theme.navigationBar.font,
                                    .backgroundColor: theme.navigationBar.background]
        if isTranslucent {
            self.setBackgroundImage(UIImage(), for: .default)
            self.shadowImage = UIImage()
        }
    }
}
