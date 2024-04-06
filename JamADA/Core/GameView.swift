//
//  GameView.swift
//  JamADA
//
//  Created by Victor Kammerer on 06/04/24.
//

import SwiftUI

struct GameView: View {
    @StateObject private var gameViewModel = GameViewModel(players: [])
    
    let players: [Player]
    
    var body: some View {
        VStack {
            Button("Start Game") {
                gameViewModel.distributeCards()
            }
            
            Spacer()
            
            // Display player cards
            ForEach(gameViewModel.players) { player in
                if let card = player.card {
                    PlayerCardView(playerName: player.name, card: card)
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
        }
    }
}

struct PlayerCardView: View {
    var playerName: String
    var card: String
    
    var body: some View {
        VStack {
            Text(playerName)
            Text(card)
        }
    }
}

#Preview {
    GameView(players: [])
}
