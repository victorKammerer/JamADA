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
    
    @StateObject var flipCardPresenter = NVFlipCardPresenter()
    
    var body: some View {
        VStack {
            ThemeView(buttonText: theme, icon: icon)
                .padding()
            
            Spacer()
            
            Text(playerName)
                .font(.system(size: 24, weight: .bold, design: .rounded))
                .kerning(0.5)
                .padding()
            
            
            NVFlipCardView(cardName: card, themeName: theme, presenter: flipCardPresenter)
                .foregroundStyle(.red)
            
            Spacer()
            
        }
    }
}

#Preview {
    GameCardsView(playerName: "Kammerer", card: "impostor", theme: "Praia", icon: "figure.open.water.swim")
}
