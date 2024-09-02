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
  
  @Published var players: [Player]
  @Published var theme: String
  @Published var icon: String
  
  init(players: [Player], theme: String, icon: String) {
    self.players = players
    self.theme = theme
    self.icon = icon
  }
  
  func distributeCards() {
    let randomThemeIndex = Int.random(in: 0..<cardModel.cards.count)
    let selectedTheme = cardModel.cards[randomThemeIndex]
    theme = selectedTheme.theme
    icon = selectedTheme.icon
    
    let numPlayers = players.count
    let impostorIndex = Int.random(in: 0..<numPlayers)
    
    var availableCards = selectedTheme.cards
    
    for i in 0..<numPlayers {
      var playerCard: String
      if i == impostorIndex {
        playerCard = "Impostor"
      } else {
        let randomCardIndex = Int.random(in: 0..<availableCards.count)
        playerCard = availableCards.remove(at: randomCardIndex)
      }
      
      players[i].card = playerCard
    }
    
  }
}
