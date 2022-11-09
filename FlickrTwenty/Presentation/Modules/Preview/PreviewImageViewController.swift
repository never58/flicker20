//
//  ViewController.swift
//  FlickrTwenty
//
//  Created by Nikita Rakov on 23/07/2019.
//  Copyright © 2019 Nikita Rakov. All rights reserved.
//

import UIKit

class PreviewImageViewController: UIViewController {

    private var collectionView: UICollectionView!

    private var isLoading = false
    private var page: Int = 1
    private var perPage: Int = 20
    private var maxPages: Int = Int.max
	
	private var viewModel: [ImageModel] = [] {
		didSet {
			registerItemCellNib()
			collectionView.reloadData()
		}
	}
	
	private let networkImagesService = NetworkImagesService()

	override func viewDidLoad() {
		super.viewDidLoad()
        setupViews()
        makeLayout()
        initialState()
	}

    private func setupViews() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()

        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)

        view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    private func makeLayout() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        view.backgroundColor = .green
        [
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ].activate()
    }
	
	private func registerItemCellNib() {
        if let itemViewModel = viewModel.first {
            collectionView.register(itemViewModel.cellClass, forCellWithReuseIdentifier: itemViewModel.reuseIdentifier)
        }
	}
	
	private func loadNextPage() {
        guard page <= maxPages else {
            print("Last page already downloaded")
            return
        }
        let requestModel = ImageRequestModel(perPage: perPage, page: page)
        networkImagesService.getImages(by: requestModel) { [weak self] result in
            self?.isLoading = false
			switch result {
			case .success(let photoModel):
                guard let self = self else { return }
                self.viewModel = self.viewModel + photoModel.photo
                self.maxPages = photoModel.pages
                self.page += 1
			case .failure:
				assertionFailure("Что-то пошло не так в запросе списка картинок")
			}
		}
	}

    private func initialState() {
        page = 1
        loadNextPage()
    }
	
	func openImageView(with viewModel: ImageModel) {
		let newVC = ImageViewController(viewModel: viewModel)
        present(newVC, animated: true)
	}
}

extension PreviewImageViewController: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return viewModel.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let viewModel = self.viewModel[indexPath.item]
		
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: viewModel.reuseIdentifier,
															for: indexPath) as? CellViewModelConfigurable else {
			assertionFailure("\(String(describing: self)) не получил ячейку")
			return UICollectionViewCell()
		}
		
		cell.configure(with: viewModel)
		return cell
	}
	
}

extension PreviewImageViewController: UICollectionViewDelegate {
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let viewModel = self.viewModel[indexPath.item]
		openImageView(with: viewModel)
	}

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard !isLoading else { return }
        let limitToLoadNextPage = viewModel.count - 5
        guard indexPath.row > limitToLoadNextPage else { return }
        isLoading = true
        loadNextPage()
    }
}

extension PreviewImageViewController: UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView,
						layout collectionViewLayout: UICollectionViewLayout,
						sizeForItemAt indexPath: IndexPath) -> CGSize {

        let viewModel = self.viewModel[indexPath.item]

        return (viewModel.cellClass as? CellSizeProtocol.Type)?.getCellSize(by: viewModel, with: collectionView.frame.size) ?? .zero
    }
}

