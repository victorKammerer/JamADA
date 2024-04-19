//
//  GameVoteViewModel.swift
//  JamADA
//
//  Created by Lucas Daniel Costa da Silva on 19/04/24.
//

import Foundation

class GameVoteViewModel: ObservableObject {
  
  var players: [Player]
  var playerTurn: Int = 0
  
  
  init(players: [Player], playerTurn: Int = 0) {
    self.players = players
    self.playerTurn = playerTurn
  }
  
  func nextPlayerToVote(){
    self.playerTurn += 1
  }
  
}
