//
//  SetupView.swift
//  JamADA
//
//  Created by Victor Kammerer on 06/04/24.
//

import SwiftUI
import SwiftData

struct SetupView: View {
    
    @Environment(\.modelContext) private var context
    
    @State private var step: Int = 0
    @StateObject var viewModel = SetupViewModel()
    
    @Query private var items: [Player]
           
    var body: some View {
        if step == 0 {
            VStack () {
                
                Text("Setup Game")
                    .font(.title)
                    .padding()
                
                Stepper(value: $viewModel.numberOfPlayers, in: 1...10) {
                    Text("Number of Players: \(viewModel.numberOfPlayers)")
                }
                .padding()
                
                Stepper(value: $viewModel.numberOfRounds, in: 1...10) {
                    Text("Number of Rounds: \(viewModel.numberOfRounds)")
                }
                .padding()
                
                Button("Next") {
                    viewModel.startGame()
                    step += 1
                }
                .padding()
            }
            .padding()
        } else if step == 1{
            
            Text("Jogador \(viewModel.playerCount)")
                .font(.title)
                .padding()
            
            playerNameBar
            
            
            if viewModel.buttonAppearing && !viewModel.isPlayerLimitReached() {
                Button("NEXT") {
                    addItem()
                    viewModel.username = ""
                }
            }
//            List {
//                ForEach (items) { item in
//                    Text(item.name)
//                }
//                .onDelete{ indexes in
//                    for index in indexes {
//                        deleteItens(items[index])
//                    }
//                }
//            }
        } else {
            Text("sla porra")
        }
    }
    
    func addItem() {
        let item = Player(name: viewModel.username)
        print(item.id)
        print(item.name)
        context.insert(item)
        
        viewModel.incrementPlayerCount()
    }
    
    func deleteItens(_ item: Player) {
        context.delete(item)
    }
}


#Preview {
    SetupView()
}
