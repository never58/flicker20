//
//  CellViewModelConfigurable.swift
//  FlickrTwenty
//
//  Created by Nikita Rakov on 23/07/2019.
//  Copyright © 2019 Nikita Rakov. All rights reserved.
//

import UIKit

protocol CellViewModelConfigurable where Self: UICollectionViewCell {
	func configure(with viewModel: ConfigurableViewModelProtocol)
}
