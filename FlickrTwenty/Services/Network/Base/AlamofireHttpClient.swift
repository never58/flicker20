//
//  AlamofireHttpClient.swift
//  FlickrTwenty
//
//  Created by Nikita Rakov on 23/07/2019.
//  Copyright © 2019 Nikita Rakov. All rights reserved.
//

import Foundation
import Alamofire

class AlamofireHttpClient: HttpClient {
	func get(parameters: [String: Any]?, completion: @escaping (Data?) -> Void) {
		request(.get, parameters: parameters, completion: completion)
	}
	
	private func request(_ method: HTTPMethod,
						 parameters: [String: Any]?,
						 completion: @escaping (Data?) -> Void) {
		var fullParameters = parameters ?? [:]
		fullParameters["api_key"] = apiKey
		fullParameters["format"] = format
		fullParameters["nojsoncallback"] = noJSONCallback
		
		AF.request(baseURL,
				   method: method,
				   parameters: fullParameters)
			.validate()
			.responseString { response in
				if let statusCode = response.response?.statusCode, statusCode < 200 || statusCode >= 300 {
					print("ERROR. Status code: \(statusCode)")
					completion(nil)
				} else {
					guard let data = response.data
						else {
							print("Data не Data")
							completion(nil)
							return
					}
					completion(data)
				}
		}
	}
}
