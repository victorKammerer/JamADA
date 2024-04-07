//
//  GameView.swift
//  JamADA
//
//  Created by Victor Kammerer on 06/04/24.
//

import SwiftUI

struct GameView: View {
    @StateObject private var gameViewModel = GameViewModel(players: [], theme: "", icon: "")
    
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
            
            RectangleButtonView(buttonText: "Próximo", textColor: nil, buttonColor: nil, action:  {currentIndex = (currentIndex + 1) % gameViewModel.players.count
            }, usesSymbol: true)
            
            Spacer()
        }
        .padding()
        .onAppear {
            for player in players {
                gameViewModel.players.append(Player(name: player.name))
                print("TO AQUI" + player.name)
            }
            gameViewModel.distributeCards()
        }
    }
}

#Preview {
    GameView(players: [], theme: "")
}
