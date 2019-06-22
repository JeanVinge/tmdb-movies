//
//  ReleaseDateView.swift
//  tmdb-movies
//
//  Created by jean.vinge on 22/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import Utility

class ReleaseDateView: GenericView {

    lazy var titleLabel: UILabel = UILabel(ViewStyle<UILabel> {
        $0.textColor = .systemBlue
        $0.font = .systemFont(ofSize: 10, weight: .bold)
    })

    override func initSubviews() {
        addSubview(titleLabel)
        layer.cornerRadius = 2
        layer.masksToBounds = true
        layer.borderWidth = 1
        layer.borderColor = UIColor.systemBlue.cgColor
    }

    override func initConstraints() {
        titleLabel.snp.makeConstraints { (make) in
            make.top.left.right.bottom.equalToSuperview().inset(5)
        }
    }

}
