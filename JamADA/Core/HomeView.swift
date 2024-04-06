//
//  ContentView.swift
//  JamADA
//
//  Created by Victor Kammerer on 06/04/24.
//

import SwiftUI

struct HomeView: View {
    
    @State private var nextView: Bool = false
    
    var body: some View {
        NavigationLink(destination: SetupPlayersView().navigationBarBackButtonHidden(),
                       isActive: $nextView) {
            EmptyView()
        }
                       .hidden()
        
        Button(action: {
            nextView = true
        }) {
            RectangleButtonView(buttonText: "Jogar", textColor: nil,
                                buttonColor: .black,
                                action: {
                UIView.setAnimationsEnabled(false)
                nextView = true
            }, usesSymbol: false)
        }
    }
}

#Preview {
    HomeView()
}
