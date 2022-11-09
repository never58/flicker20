//
//  NetworkService.swift
//  FlickrTwenty
//
//  Created by Nikita Rakov on 23/07/2019.
//  Copyright © 2019 Nikita Rakov. All rights reserved.
//

import Foundation

class NetworkService {
	let client: HttpClient = {
		return AlamofireHttpClient()
	}()
}
