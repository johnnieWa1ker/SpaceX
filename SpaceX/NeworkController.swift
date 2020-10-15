//
//  NeworkController.swift
//  SpaceX
//
//  Created by Johnnie Walker on 10/8/20.
//  Copyright © 2020 Johnnie Walker. All rights reserved.
//

import Foundation
import UIKit

class NetworkController: ObservableObject {
	@Published var rockets: [Rocket] = []
	
	func fetchRockets() {
		let url = URL(string: "https://api.spacexdata.com/v4/launches?limit=10")!
		let request = NetworkRequest(url: url)
		request.execute { [weak self] (data) in
			if let data = data {
				self?.decodeRockets(data)
			}
		}
	}
}

private extension NetworkController {
    
	func decodeRockets(_ data: Data) {
		let decoder = JSONDecoder()
		decoder.dateDecodingStrategy = .formatted(DateFormatter.shortISO8601)
		rockets = (try? decoder.decode([Rocket].self, from: data)) ?? []
		for rocket in rockets {
			fetchPatch(for: rocket)
		}
	}
	
    func fetchPatch(for rocket: Rocket) {
        guard let logoURL = rocket.logoURL else { return }
        let request = NetworkRequest(url: logoURL)
        request.execute { [weak self] (data) in
            guard let data = data else { return }
            guard let index = self?.rockets.firstIndex(where: { $0.id == rocket.id }) else { return }
            self?.rockets[index].logoImage = UIImage(data: data)
        }
	}
}
