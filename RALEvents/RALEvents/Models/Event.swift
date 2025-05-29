//
//  Event.swift
//  RALEvents
//
//  Created by Akarsh Gharge on 2025-05-27.
//

import Foundation

struct Event: Codable, Identifiable {
    let id: Int
    let name: String
    let location: String
    let startDate: Date
    let endDate: Date
    let url: String

    private enum CodingKeys: String, CodingKey {
        case id, name, location, startDate, endDate, url
    }
}
