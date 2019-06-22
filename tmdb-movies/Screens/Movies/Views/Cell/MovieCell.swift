//
//  MovieCell.swift
//  tmdb-movies
//
//  Created by jean.vinge on 20/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import Utility
import Domain
import Kingfisher
import Resources

final class MovieCell: GenericView, ContainerCellConvertible {

    // MARK: Var

    typealias Configuration = Movie
    var resize: ContentResize = .size(CGSize(width: UIScreen.main.bounds.width / 2, height: 350))

    lazy var imageView = UIImageView(ViewStyle<UIImageView> {
        $0.contentMode = .scaleAspectFill
    })

    lazy var titleLabel = UILabel(ViewStyle<UILabel> {
        $0.font = .systemFont(ofSize: 15, weight: .heavy)
        $0.textColor = .white
        $0.numberOfLines = 0
        $0.textAlignment = .left
    })

    lazy var releaseDataView = ReleaseDateView()

    lazy var genreView = GenreView()

    // MARK: Init

    func prepareForReuse() {
        imageView.kf.cancelDownloadTask()
        titleLabel.text = ""
        releaseDataView.titleLabel.text = ""
        genreView.titleLabel.text = ""
    }

    override func initSubviews() {
        addSubview(imageView)
        addSubview(genreView)
        addSubview(titleLabel)
        addSubview(releaseDataView)
        addSubview(genreView)
        imageView.layer.cornerRadius = 8
        imageView.layer.masksToBounds = true
    }

    override func initConstraints() {
        imageView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview().inset(10)
            make.height.equalTo(270)
        }
        genreView.snp.makeConstraints { (make) in
            make.top.equalTo(imageView.snp.top)
            make.left.greaterThanOrEqualToSuperview().inset(50)
            make.right.equalToSuperview()
        }
        titleLabel.snp.makeConstraints { (make) in
//            make.top.equalTo(imageView.snp.bottom).offset(2)
            make.left.right.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(15)
        }
        releaseDataView.snp.makeConstraints { (make) in
            make.top.equalTo(imageView.snp.bottom).offset(2)
        }
    }

    func setup(with data: Any) {
        guard let data = data as? Movie else { return }
        titleLabel.text = data.title
        releaseDataView.titleLabel.text = "\(L10n.General.releaseDate): \(data.releaseFullDate.lowercased())"
        imageView.kf.setImage(with: data.poster, options: [.transition(.fade(1))])
        genreView.titleLabel.text = data.genreDescription
    }
}
