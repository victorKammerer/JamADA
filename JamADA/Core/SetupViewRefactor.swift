//
//  SetupViewRefactor.swift
//  JamADA
//
//  Created by Lucas Daniel Costa da Silva on 06/04/24.
//

import SwiftUI
import SwiftData

struct SetupViewRefactor: View {
    
    @Environment(\.modelContext) private var context
    
    @State private var step: Int = 0
    @StateObject var viewModel = SetupViewModel()
    
    @Query private var items: [Player]
    
    var body: some View {
        NavigationStack{
            VStack {
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
                
                NavigationLink(destination: PlayerNameView(), label: {
                    Text("Próximo")
                })
            }
            .padding()
        }
    }
}

#Preview {
    SetupViewRefactor()
}
