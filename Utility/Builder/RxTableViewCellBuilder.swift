//
//  RxTableViewCellBuilder.swift
//  Utility
//
//  Created by jean.vinge on 22/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import UIKit
import RxDataSources

public struct RxTableViewCellBuilder<T: AnimatableSectionModelType, C: ContentView> {

    public var dataSource: RxTableViewSectionedAnimatedDataSource<T>!

    public init() {
        let animation = AnimationConfiguration(insertAnimation: .fade,
                                               reloadAnimation: .fade,
                                               deleteAnimation: .automatic)
        self.dataSource = RxTableViewSectionedAnimatedDataSource<T>
            .init(animationConfiguration: animation,
                  configureCell: { (_, tableView, indexPath, item) -> UITableViewCell in
            return tableView.dequeue(C.self,
                                     at: indexPath,
                                     with: item)
        })
    }
}
