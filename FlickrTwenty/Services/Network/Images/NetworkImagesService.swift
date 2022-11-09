//
//  NetworkImagesService.swift
//  FlickrTwenty
//
//  Created by Nikita Rakov on 23/07/2019.
//  Copyright © 2019 Nikita Rakov. All rights reserved.
//

import Foundation

protocol NetworkImagesServiceProtocol {
    func getImages(by requestModel: ImageRequestModel, completion: @escaping (Result<PhotoModel>) -> Void)
}

struct ImageRequestModel {
    let perPage: Int
    let page: Int
}

class NetworkImagesService: NetworkService, NetworkImagesServiceProtocol {
	
	private let imagesMethod = "flickr.interestingness.getList"
    private let extra = "url_m"

    func getImages(by requestModel: ImageRequestModel, completion: @escaping (Result<PhotoModel>) -> Void) {
		let parameters = ["method": imagesMethod,
                          "extras": extra,
                          "per_page": "\(requestModel.perPage)",
                          "page": "\(requestModel.page)"]
		client.get(parameters: parameters) { data in
			guard let data = data else {
				completion(.failure)
				return
			}
			do {
				let decoder = JSONDecoder()
				let photos: PhotosModel = try decoder.decode(PhotosModel.self, from: data)
				completion(.success(photos.photos))
			} catch let error {
				assertionFailure(error.localizedDescription)
				completion(.failure)
			}
		}
	}
}
