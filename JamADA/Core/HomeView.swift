//
//  ContentView.swift
//  JamADA
//
//  Created by Victor Kammerer on 06/04/24.
//

import SwiftUI

struct HomeView: View {
    
    @State private var nextView: Bool = false
    
    @Environment(\.modelContext) private var context
    
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
            deleteAll()
            nextView = true
            print(nextView)
        }, usesSymbol: false)
        
        
    }
    
    func deleteAll() {
        do {
            try context.delete(model: Player.self)
        } catch {
            print("Failed to clear all data.")
        }
    }
}

#Preview {
    HomeView()
}
