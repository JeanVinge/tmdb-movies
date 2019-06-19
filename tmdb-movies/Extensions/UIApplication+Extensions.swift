//
//  UIApplication+Extensions.swift
//  tmdb-movies
//
//  Created by jean.vinge on 11/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import UIKit

extension UIApplication {
    var appDelegate: AppDelegate {
        guard let appDelegate = self.delegate as? AppDelegate else { fatalError("Can't instantiate AppDelegate") }
        return appDelegate
    }
}
