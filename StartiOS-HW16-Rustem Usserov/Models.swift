//
//  Models.swift
//  StartiOS-HW16-Rustem Usserov
//
//  Created by Rustem on 10.05.2024.
//

import Foundation

struct CardResponse: Codable {
    let cards: [MagicCard]
}

struct MagicCard: Codable {
    let name, manaCost: String
    let type: String
    let setName: String
}

enum CardEdition: String, Codable {
    case tenth = "Tenth Edition"
    case ninthEdition = "Ninth Edition"
    case specialEdition = "Special Edition"
}
