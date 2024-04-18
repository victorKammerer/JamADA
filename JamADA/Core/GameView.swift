//
//  GameView.swift
//  JamADA
//
//  Created by Victor Kammerer on 06/04/24.
//

import SwiftUI

struct GameView: View {
  @StateObject private var gameViewModel = GameViewModel(players: [], theme: "", icon: "")
  
  @State private var nextView: Bool = false
  @State private var currentIndex: Int = 0
  
  let players: [Player]
  let theme: String
  
  var currentPlayer: Player? {
    guard currentIndex < gameViewModel.players.count else {
      return nil
    }
    return gameViewModel.players[currentIndex]
  }
  
  var body: some View {
    VStack {
      
      
      Spacer()
      
      
      if let currentPlayer = currentPlayer, let card = currentPlayer.card {
        GameCardsView(playerName: currentPlayer.name, card: card, theme: gameViewModel.theme, icon: gameViewModel.icon)
      }
      
      NavigationLink(destination: TimerView(players: players, countFrom: 15).navigationBarBackButtonHidden(),
                     isActive: $nextView) {
        EmptyView()
      }.transition(.opacity)
        .hidden()
      
      RectangleButtonView(buttonText: "Próximo", textColor: nil, buttonColor: nil, action:  {
        if currentIndex == (gameViewModel.players.count - 1) {
          nextView = true
        } else {
          currentIndex = (currentIndex + 1) % gameViewModel.players.count
        }
      }, usesSymbol: true)
      .padding()
      
      
      
      Spacer()
    }
    .padding()
    .onAppear {
      for player in players {
        gameViewModel.players.append(Player(name: player.name))
      }
      gameViewModel.distributeCards()
    }
  }
}

#Preview {
  GameView(players: [], theme: "")
}
