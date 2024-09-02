//
//  GameImpersonatorReveal.swift
//  JamADA
//
//  Created by Lucas Daniel Costa da Silva on 23/04/24.
//

import SwiftUI
import SwiftData

struct GameImpersonatorReveal: View {
  
  @Environment(\.modelContext) private var context
  
  @EnvironmentObject var setupConfig: SetupConfig
  
  @Query private var players: [Player]
  
  @State private var nextView: Bool = false
  
  var body: some View {
    VStack(spacing: 14){
      Text ("E o impostor foi...")
        .font(.system(size: 36, weight: .bold, design: .rounded))
      Text (getImpersonator(players: players).name + "!")
        .font(.system(size: 36, weight: .bold, design: .rounded))
      Spacer()
      Spacer()
      Text("Parabéns por ter enganado todo mundo!")
      Spacer()
      if(setupConfig.rounds > 1){
        NavigationLink(destination: GameLoadingView(players: players).navigationBarBackButtonHidden(),
                       isActive: $nextView) {
          EmptyView()
        }
                       .transition(.opacity)
                       .hidden()
        RectangleButtonView(buttonText: "Prosseguir para o próximo round!", textColor: nil, buttonColor: nil, action: {
          UIView.setAnimationsEnabled(false)
          setupConfig.rounds -= 1
          for player in players {
            player.voteCount = 0
            if player.isActualImpersonator == true {
              player.isActualImpersonator = false
            }
          }
          nextView = true
        }, usesSymbol: false)
      } else {
        NavigationLink(destination: HomeView().navigationBarBackButtonHidden(),
                       isActive: $nextView) {
          EmptyView()
        }.transition(.opacity)
          .hidden()
        RectangleButtonView(buttonText: "Tela inicial", textColor: nil, buttonColor: nil, action: {
          UIView.setAnimationsEnabled(false)
          nextView = true
        }, usesSymbol: true)
      }
    }
  }
  
  func getImpersonator(players: [Player]) -> Player {
    for player in players {
      if player.isActualImpersonator{
        return player
      }
    }
    return Player(name: "", voteCount: 0, isActualImpersonator: false)
  }
}

#Preview {
  GameImpersonatorReveal()
}
