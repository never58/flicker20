//
//  UIImageView+Download.swift
//  FlickrTwenty
//
//  Created by Nikita Rakov on 23/07/2019.
//  Copyright © 2019 Nikita Rakov. All rights reserved.
//

import UIKit
import SDWebImage

extension UIImageView {
	func downloadImage(by imageModel: ImageModel) {
		sd_setImage(with: makeURL(from: imageModel))
	}
	
	func cancelCurrentImageLoad() {
		sd_cancelCurrentImageLoad()
	}
	
	private func makeURL(from imageModel: ImageModel) -> URL? {
		return imageModel.url
	}
}
