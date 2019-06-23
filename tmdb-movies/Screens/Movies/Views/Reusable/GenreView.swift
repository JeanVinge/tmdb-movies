//
//  GenreView.swift
//  tmdb-movies
//
//  Created by jean.vinge on 20/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import Utility

final class GenreView: GenericView {

    // MARK: Var

    lazy var titleLabel = UILabel(ViewStyle<UILabel> {
        $0.font = .systemFont(ofSize: 12, weight: .medium)
        $0.textColor = .white
        $0.numberOfLines = 0
        $0.textAlignment = .right
    })

    override func initSubviews() {
        addSubview(titleLabel)
        backgroundColor = .red
        clipsToBounds = true
    }

    override func initConstraints() {
        titleLabel.snp.makeConstraints { (make) in
            make.top.left.right.bottom.equalToSuperview().inset(2)
        }
    }
}
