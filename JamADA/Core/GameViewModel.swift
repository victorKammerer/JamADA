//
//  GameViewModel.swift
//  JamADA
//
//  Created by Victor Kammerer on 06/04/24.
//

import Foundation
import SwiftData

class GameViewModel: ObservableObject {
    let cardModel = CardModel.shared
    
    @Published var players: [Player] = []
    
    init(players: [Player]) {
        self.players = players
    }
    
    func distributeCards() {
        let numPlayers = players.count
        let impostorIndex = Int.random(in: 0..<numPlayers)
        
        for i in 0..<numPlayers {
            var playerCard: String
            if i == impostorIndex {
                playerCard = "Impostor"
            } else {
                let randomCardIndex = Int.random(in: 0..<cardModel.cards.count)
                playerCard = cardModel.cards[randomCardIndex].cards.randomElement() ?? ""
            }
            
            players[i].card = playerCard
        }
    }
}
