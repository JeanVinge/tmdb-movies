//
//  UIViewController+Extensions.swift
//  Utility
//
//  Created by jean.vinge on 14/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import UIKit

extension UIViewController {
    func configureTheme(_ theme: Theme) {
        self.view.tintColor = theme.view.tintColor
        self.view.backgroundColor = theme.view.backgroundColor
        self.navigationController?.configure(theme: theme)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

        self.tabBarController?.tabBar.tintColor = theme.tabBar.tintColor
        self.tabBarController?.tabBar.barTintColor = theme.tabBar.barTintColor
        self.tabBarController?.tabBar.isTranslucent = theme.tabBar.isTranslucent

        if #available(iOS 10.0, *) {
            self.tabBarController?.tabBar.unselectedItemTintColor = theme.tabBar.unSelectedColor
        } else {
            self.tabBarController?.tabBar.items?.forEach { item in
                item.setTitleTextAttributes([.foregroundColor: theme.tabBar.unSelectedColor], for: .normal)
            }
        }
    }
}
