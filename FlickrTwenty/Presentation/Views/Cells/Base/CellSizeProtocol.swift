//
//  CellSizeProtocol.swift
//  FlickrTwenty
//
//  Created by Nikita Rakov on 08.11.2022.
//  Copyright © 2022 Nikita Rakov. All rights reserved.
//

import UIKit

protocol CellSizeProtocol {
    static func getCellSize(by viewModel: ConfigurableViewModelProtocol, with collectionViewSize: CGSize) -> CGSize
}
