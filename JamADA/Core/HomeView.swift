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
        
        Image(systemName: "theatermasks")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 237, height: 237)
            .padding()
            
        
        NavigationLink(destination: SetupPlayersView(),
                       isActive: $nextView) {
            EmptyView()
        }.hidden()
        
        RectangleButtonView(buttonText: "Jogar", textColor: nil,
                            buttonColor: .black,
                            action: {
            UIView.setAnimationsEnabled(false)
            nextView = true
            print(nextView)
        }, usesSymbol: false)
    }
}

#Preview {
    HomeView()
}
