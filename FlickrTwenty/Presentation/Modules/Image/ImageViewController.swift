//
//  ImageViewController.swift
//  FlickrTwenty
//
//  Created by Nikita Rakov on 23/07/2019.
//  Copyright © 2019 Nikita Rakov. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
	
	private var imageView: UIImageView = UIImageView()
    private var titleLabel: UILabel = UILabel()
    private var vStack: UIStackView = UIStackView()
	
	let viewModel: ImageModel

    init(viewModel: ImageModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

	override func viewDidLoad() {
		super.viewDidLoad()
        setupViews()
        makeLayout()
		updateImageView()
	}

    private func setupViews() {
        view.backgroundColor = .black
        titleLabel.numberOfLines = 0
        imageView.contentMode = .scaleAspectFit

        vStack.axis = .vertical
        vStack.spacing = .zero
        vStack.distribution = .fill

        view.addSubview(vStack)
        vStack.addArrangedSubview(imageView)
        vStack.addArrangedSubview(titleLabel)
    }

    private func makeLayout() {
        vStack.translatesAutoresizingMaskIntoConstraints = false
        [
            vStack.topAnchor.constraint(equalTo: view.topAnchor),
            vStack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            vStack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            vStack.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ].activate()
    }
	
	func updateImageView() {
		imageView.downloadImage(by: viewModel)
        titleLabel.text = viewModel.title
	}
	
}
