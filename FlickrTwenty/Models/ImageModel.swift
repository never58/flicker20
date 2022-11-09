//
//  ImageModel.swift
//  FlickrTwenty
//
//  Created by Nikita Rakov on 23/07/2019.
//  Copyright © 2019 Nikita Rakov. All rights reserved.
//

import Foundation
import UIKit

struct ImageModel: Codable, ConfigurableViewModelProtocol {

	let id: String
	let title: String
    private let url_m: String // TODO rename
    private let height_m: Int // TODO rename
    private let width_m: Int // TODO rename

    var width: Int {
        Int(width_m)
    }

    var height: Int {
        Int(height_m)
    }

    var url: URL? {
        URL(string: url_m)
    }

    var cellClass: UICollectionViewCell.Type {
        PreviewImageCollectionViewCell.self
    }
}

struct PhotosModel: Codable {
	let photos: PhotoModel
}

struct PhotoModel: Codable {
	let photo: [ImageModel]
    let pages: Int
    let total: Int
}


