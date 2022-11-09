//
//  PreviewImageCollectionViewCell.swift
//  FlickrTwenty
//
//  Created by Nikita Rakov on 23/07/2019.
//  Copyright © 2019 Nikita Rakov. All rights reserved.
//

import UIKit

class PreviewImageCollectionViewCell: UICollectionViewCell {
	
    private var imageView: UIImageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        makeLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        addSubview(imageView)
    }

    private func makeLayout() {
        imageView.translatesAutoresizingMaskIntoConstraints = false

        [
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ].activate()
    }

	override func prepareForReuse() {
		imageView.cancelCurrentImageLoad()
		imageView.image = nil
	}

}

extension PreviewImageCollectionViewCell: CellViewModelConfigurable {
	func configure(with viewModel: ConfigurableViewModelProtocol) {
		if let viewModel = viewModel as? ImageModel {
			imageView.downloadImage(by: viewModel)
		}
	}
}

extension PreviewImageCollectionViewCell: CellSizeProtocol {
    static func getCellSize(by viewModel: ConfigurableViewModelProtocol, with collectionViewSize: CGSize) -> CGSize {
        guard let viewModel = viewModel as? ImageModel else {
            return .zero
        }
        let height = CGFloat(viewModel.height) / (CGFloat(viewModel.width) / collectionViewSize.width)
        return .init(width: collectionViewSize.width, height: height)
    }
}
