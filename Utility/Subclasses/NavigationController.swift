//
//  NavigationController.swift
//  Utility
//
//  Created by jean.vinge on 21/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import UIKit

open class NavigationController: UINavigationController {

    // MARK: Init

    public init(_ rootViewController: UIViewController) {
        super.init(nibName: nil, bundle: nil)
        setViewControllers([rootViewController],
                                animated: false)
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
