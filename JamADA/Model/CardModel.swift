//
//  CardModel.swift
//  JamADA
//
//  Created by Victor Kammerer on 06/04/24.
//

import Foundation

struct CardData: Codable {
    var theme: String
    var cards: [String]
}

class CardModel {
    static let shared = CardModel()
    
    var cards: [CardData] = []
    
    init() {
        loadCards()
    }
    
    func loadCards() {
        let beachCards = CardData(theme: "Beach", cards: ["Impostor", "Surfer", "Skater", "Swimmer", "Shark", "Beach tennis player", "Kid"])
        let birthdayCards = CardData(theme: "Birthday Party", cards: ["Impostor", "Birthday person", "Clown", "Magician", "Mother", "Kid playing", "Waiter"])
        cards = [beachCards, birthdayCards]
    }
}
