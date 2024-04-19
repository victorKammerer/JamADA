//
//  GameLoadingView.swift
//  JamADA
//
//  Created by Victor Kammerer on 06/04/24.
//

import SwiftUI

// Model for a player
struct Party {
  var name: String
  var card: String?
}

struct GameLoadingView: View {
  @State private var load = 0.0
  
  let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
  
  @State private var nextView: Bool = false
  
  let players: [Player]
  
  var body: some View {
    VStack {
      Image(systemName: "figure.cooldown")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 171, height: 171)
        .padding()
      
      Text("Mantenha Segredo!")
        .font(.system(size: 24, weight: .semibold, design: .rounded))
        .padding(.vertical, 5)
      Text("Sempre que souber o seu papel na rodada, tente não falar ou ter expressões que possam dar pistas de quem você é!")
        .font(.system(size: 16, weight: .regular, design: .rounded))
        .multilineTextAlignment(.center)
        .frame(width: 286)
        .padding(.vertical, 5)
      
      if load < 100 {
        ProgressView("", value: load, total: 100)
          .tint(.secondary)
          .frame(width: 270)
          .onReceive(timer) { _ in
            if load < 100 {
              load += 2
            }
          }
      } else {
        
        NavigationLink(destination: GameView(players: players, theme: "").navigationBarBackButtonHidden(),
                       isActive: $nextView) {
          EmptyView()
        }.transition(.opacity)
          .hidden()
        
        RectangleButtonView(buttonText: "Começar", textColor: nil, buttonColor: nil, action: {
          nextView = true
        }, usesSymbol: false)
        .padding(.vertical)
      }
    }
  }
}

#Preview {
  GameLoadingView(players: [])
}
