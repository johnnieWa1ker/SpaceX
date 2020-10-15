//
//  Rocket.swift
//  SpaceX
//
//  Created by Johnnie Walker on 10/8/20.
//  Copyright © 2020 Johnnie Walker. All rights reserved.
//

import Foundation
import UIKit

struct Rocket: Identifiable {
    let id: String
    let flightNumber: Int
    let name: String
    let date: Date?
    let success: Bool?
    let anotherDate: Date?
    let logoURL: URL?
    var logoImage: UIImage?
    let wiki: URL?
    let core: String?
    
    
    // Computed properties
    var formattedLaunchDate: String {
        if let date = date {
            let formatter = DateFormatter()
            formatter.dateStyle = .full
            return formatter.string(from: date)
        } else {
            return "N/A"
        }
    }
}

extension Rocket: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case flightNumber = "flight_number"
        case name
        case date = "static_fire_date_utc"
        case success
        case staticFireDate = "date_utc"
        case links
        enum LinksKeys: String, CodingKey {
            case patch
            case wiki = "wikipedia"
            enum PatchKeys: String, CodingKey {
                case logo = "small"
            }
        }
        case cores
        enum CoresKeys: String, CodingKey {
            case core
        }
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        flightNumber = try container.decode(Int.self, forKey: .flightNumber)
        name = try container.decode(String.self, forKey: .name)
        date = try? container.decode(Date.self, forKey: .date)
        success = try? container.decode(Bool.self, forKey: .success)
        anotherDate = try? container.decode(Date.self, forKey: .staticFireDate)

        let linksContainer = try container.nestedContainer(keyedBy: CodingKeys.LinksKeys.self, forKey: .links)
        wiki = try? linksContainer.decode(URL.self, forKey: .wiki)

        let patchContainer = try linksContainer.nestedContainer(keyedBy: CodingKeys.LinksKeys.PatchKeys.self, forKey: .patch)
        logoURL = try? patchContainer.decode(URL.self, forKey: .logo)
        
        var coresContainer = try container.nestedUnkeyedContainer(forKey: .cores)
        var cores = ""
        while !coresContainer.isAtEnd {
            let coreContainer = try coresContainer.nestedContainer(keyedBy: CodingKeys.CoresKeys.self)
            let coreUndef = try? coreContainer.decode(String.self, forKey: .core)
            if let core = coreUndef {
                cores += cores == "" ? core : ", \(core)"
            }
        }
        self.core = cores
        
    }
}

struct Payload {
    var name: String
    var type: String
}

extension Payload: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case name
        case type
    }
}
