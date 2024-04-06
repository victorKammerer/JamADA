//
//  PlayerNameView.swift
//  JamADA
//
//  Created by Lucas Daniel Costa da Silva on 06/04/24.
//

import SwiftUI
import SwiftData

struct PlayerNameView: View {
    
    @Environment(\.modelContext) private var context
    
    @State private var step: Int = 0
    @State private var isOver: Bool = false
    
    @StateObject var viewModel = SetupViewModel()
    
    @Query private var items: [Player]
    
    var body: some View {            
        Text("Jogador \(viewModel.playerCount)")
            .font(.title)
            .padding()
        
        playerNameBar
        
        if viewModel.buttonAppearing {
            Button("NEXT") {
                print("teste")
                addItem()
                viewModel.username = ""
            }
        }
        
        List {
            ForEach (items) { item in
                Text(item.name)
            }
        }
        
        NavigationLink(destination: Text("outra tela"), isActive: $isOver) {
            EmptyView()
        }
        .hidden() // Hide the link, but it still works
        
    }
    
    func addItem() {
        let item = Player(name: viewModel.username)
        print("item: \(item.name)")
        context.insert(item)
        
        viewModel.incrementPlayerCount()
        if viewModel.isPlayerLimitReached() {
            isOver = true
        }
    }
}

#Preview {
    PlayerNameView()
}
