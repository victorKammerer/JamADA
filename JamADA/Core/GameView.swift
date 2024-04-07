//
//  GameView.swift
//  JamADA
//
//  Created by Victor Kammerer on 06/04/24.
//

import SwiftUI

struct GameView: View {
    @StateObject private var gameViewModel = GameViewModel(players: [], theme: "", icon: "")
    
    let players: [Player]
    let theme: String
    
    var body: some View {
        VStack {
               
            
            Spacer()
            
            ForEach(gameViewModel.players) { player in
                if let card = player.card {
                    GameCardsView(playerName: player.name, card: card, theme: gameViewModel.theme, icon: gameViewModel.icon)
                }
            }
            
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
