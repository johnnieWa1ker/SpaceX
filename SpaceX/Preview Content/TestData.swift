//
//  TestData.swift
//  SpaceX
//
//  Created by Johnnie Walker on 10/8/20.
//  Copyright © 2020 Johnnie Walker. All rights reserved.
//

import Foundation
import UIKit

struct TestData {
	static var rockets: [Rocket] = {
		let url = Bundle.main.url(forResource: "Rockets", withExtension: "json")!
		let data = try! Data(contentsOf: url)
		let decoder = JSONDecoder()
		decoder.dateDecodingStrategy = .formatted(DateFormatter.shortISO8601)
		var rockets = try! decoder.decode([Rocket].self, from: data)
		for (index, var rocket) in rockets.enumerated() {
            rocket.logoImage = UIImage(named: "\(rocket.id)")
			rockets[index] = rocket
		}
		return rockets
	}()
}
