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
    @State private var pos: Int = 0
    
    @StateObject var flipCardPresenter = NVFlipCardPresenter()
    
    var body: some View {
        VStack {
            if pos == 0 {
                ThemeView(buttonText: theme, icon: icon)
                
                Text(playerName)
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .kerning(0.5)
                
                NVFlipCardView(cardName: card, themeName: theme, presenter: flipCardPresenter)
                    .foregroundStyle(.red)
            }
            RectangleButtonView(buttonText: "Próximo", textColor: nil, buttonColor: nil, action: {
                pos += 1
            }, usesSymbol: true)
        }
    }
}

#Preview {
    GameCardsView(playerName: "Kammerer", card: "impostor", theme: "Praia", icon: "figure.open.water.swim")
}
