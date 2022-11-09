//
//  HttpClient.swift
//  FlickrTwenty
//
//  Created by Nikita Rakov on 23/07/2019.
//  Copyright © 2019 Nikita Rakov. All rights reserved.
//

import Foundation

protocol HttpClient {
	var baseURL: URL { get }
	var apiKey: String { get }
	var format: String { get }
	var noJSONCallback: String { get }
	func get(parameters: [String: Any]?, completion: @escaping (Data?) -> Void)
}

extension HttpClient {
	var baseURL: URL {
		return URL(string: "https://api.flickr.com/services/rest/")!
	}
	
	var apiKey: String {
		return "da9d38d3dee82ec8dda8bb0763bf5d9c"
	}
	
	var format: String {
		return "json"
	}
	
	var noJSONCallback: String {
		return "1"
	}
	
}
