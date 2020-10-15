//
//  SpaceXTests.swift
//  SpaceXTests
//
//  Created by Johnnie Walker on 10/03/2019.
//  Copyright © 2019 Johnnie Walker. All rights reserved.
//

import XCTest
@testable import SpaceX

class SpaceXTests: XCTestCase {
    
    func testDecoding() {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "Rockets", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            return
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .formatted(.shortISO8601)
        guard let rockets = try? decoder.decode(Rocket.self, from: data) else { return }
        
        // TODO: Для модульных тестов вероятно описывают полное получение данных по используемой модели. Я пока не понимаю как проверять такие данные как Date, URL, UIImage
        XCTAssertEqual(rockets.id, "5eb87cd9ffd86e000604b32a")
        XCTAssertEqual(rockets.flightNumber, 1)
        XCTAssertEqual(rockets.name, "FalconSat")
        XCTAssertEqual(rockets.success, false)
        XCTAssertEqual(rockets.core, "")
    }
}
