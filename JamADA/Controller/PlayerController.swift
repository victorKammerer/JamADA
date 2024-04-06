//
//  PlayerController.swift
//  JamADA
//
//  Created by Victor Kammerer on 06/04/24.
//

import Foundation

class PlayerController: ObservableObject {
    @Published private(set) var players: [Player] = []
    
    func addPlayer(_ player: Player) {
        if let index = players.firstIndex(where: { $0.id == player.id }) {
            players[index] = player
        } else {
            players.append(player)
        }
    }
    
    func deletePlayers(_ player: Player) {
        if let index = players.firstIndex(where: { $0.id == player.id }) {
            players.remove(at: index)
        }
    }
}
