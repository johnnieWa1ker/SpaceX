//
//  NetworkRequest.swift
//  SpaceX
//
//  Created by Johnnie Walker on 10/8/20.
//  Copyright © 2020 Johnnie Walker. All rights reserved.
//

import Foundation

class NetworkRequest {
	let url: URL
	
	init(url: URL) {
		self.url = url
	}
	
	func execute(withCompletion completion: @escaping (Data?) -> Void) {
		let task = URLSession.shared.dataTask(with: url, completionHandler: { (data: Data?, _, _) -> Void in
			DispatchQueue.main.async {
				completion(data)
			}
		})
		task.resume()
	}
}
