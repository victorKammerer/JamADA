//
//  GameVoteView.swift
//  JamADA
//
//  Created by Lucas Daniel Costa da Silva on 07/04/24.
//

import SwiftUI
import SwiftData

struct GameVoteView: View {
  @Environment(\.modelContext) private var context
  
  @Query private var players: [Player]
  
  @State var selectedPlayer: Int?
  
  @StateObject var gameVoteViewModel = GameVoteViewModel(players: [], playerTurn: 0)
  
  @State private var nextView: Bool = false
  
  var body: some View {
    VStack(spacing: 24) {
      ThemeView(buttonText: "Votação", icon: "target", width: 116, height: 34)
      Text("\(gameVoteViewModel.playerTurn + 1)º Jogador(a)").font(.system(size: 16, weight: .medium, design: .rounded))
      if(gameVoteViewModel.playerTurn < players.count){
        Text(players[gameVoteViewModel.playerTurn].name).font(.system(size: 24, weight: .medium, design: .rounded))
      }
      VStack(spacing: 16) {
        ForEach (players.indices, id: \.self) { index in
          VoteOptionView(playerName: players[index].name, isClicked: selectedPlayer == index, action: {
            UIView.setAnimationsEnabled(false)
            self.selectedPlayer = index
          })
        }
      }
      Spacer()
      RectangleButtonView(buttonText: "Confirmar", textColor: nil, buttonColor: nil, action: {
        UIView.setAnimationsEnabled(false)
        if let selectedPlayer = self.selectedPlayer {
          players[selectedPlayer].voteCount += 1
        }
        if gameVoteViewModel.playerTurn == players.count - 1 {
          nextView = true
        } else {
          gameVoteViewModel.nextPlayerToVote()
        }
        self.selectedPlayer = nil
      }, usesSymbol: false)
      Spacer()
    }
    .onAppear{
      for player in players {
        gameVoteViewModel.players.append(Player(name: player.name, voteCount: 0))
      }
    }
    NavigationLink(destination: GameVoteResult(), isActive: $nextView) {
      EmptyView()
    }.hidden()
  }}



#Preview {
  GameVoteView(selectedPlayer: nil)
}
