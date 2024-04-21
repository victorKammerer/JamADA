//
//  GameCardsView.swift
//  JamADA
//
//  Created by Victor Kammerer on 06/04/24.
//

import SwiftUI

struct GameCardsView: View {
  var playerName: String
  var card: String
  var theme: String
  var icon: String
  @Binding var revealCard: Bool
  @State var isImpostor: Bool = false
  
  @StateObject var flipCardPresenter = NVFlipCardPresenter()
  
  var body: some View {
    VStack {
      if revealCard {
        if card == "Impostor" {
          Text(playerName)
            .font(.system(size: 24, weight: .bold, design: .rounded))
            .kerning(0.5)
            .padding()
          
          NVFlipCardView(cardName: card, themeName: "Impostor", presenter: flipCardPresenter)
          
        } else {
          ThemeView(buttonText: theme, icon: icon)
            .padding()
          Spacer()
          Text(playerName)
            .font(.system(size: 24, weight: .bold, design: .rounded))
            .kerning(0.5)
            .padding()
          
          NVFlipCardView(cardName: card, themeName: theme, presenter: flipCardPresenter)
            .padding()
          
          Spacer()
        }
      } else {
        Spacer()
        Text(playerName)
          .font(.system(size: 24, weight: .bold, design: .rounded))
          .kerning(0.5)
          .padding()
        RectangleButtonView(buttonText: "Revelar Carta", textColor: nil, buttonColor: nil, action:  {
          revealCard = true
        }, usesSymbol: false)
        Spacer()
      }
    }
  }
}

#Preview {
  @State var revealCard: Bool = false
  GameCardsView(playerName: "Kammerer", card: "Ambulante", theme: "Praia", icon: "figure.open.water.swim", revealCard:
                  $revealCard)
}
