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
    @Query private var items: [Player]
    
    @State private var isOver: Bool = false
    
    @StateObject var viewModel = SetupViewModel()
    
    var body: some View {
        NavigationStack {
            Text("Nomeie os jogadores")
                .font(.system(size: 32, weight: .bold, design: .rounded))
                .padding()
            
            Text("Jogador \(viewModel.playerCount)")
                .font(.system(size: 22, weight: .medium, design: .rounded))
            
            playerNameBar
                .padding()
            
            Divider()
                .overlay(Color.primary)
                .padding(.vertical, 40)
            
            HStack {
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading) {
                        ForEach(items.indices, id: \.self) { index in
                            Text("\(index + 1)º Jogador(a)")
                                .font(.system(size: 14, weight: .semibold, design: .rounded))
                            
                            Text(items[index].name)
                                .font(.system(size: 20, weight: .bold, design: .rounded))
                            
                            Divider()
                                .frame(width: 113, height: 1)
                                .background(Color.black)
                                .padding(.bottom)
                        }
                        .padding(.horizontal)
                    }
                    .padding()
                }
                .frame(width: 200) // Fixed width for the ScrollView
                Spacer()
            }
            
            
            Spacer()
            
            NavigationLink(destination: PlayersListView(viewModel: viewModel),
                           isActive: $isOver) {
                EmptyView()
            }
                           .hidden()
            
            RectangleButtonView(buttonText: "Continuar", textColor: viewModel.buttonAppearing ? nil : Color.theme.gray2,
                                buttonColor: viewModel.buttonAppearing ? Color.black : Color.theme.gray,
                                action: {
                UIView.setAnimationsEnabled(false)
                if viewModel.buttonAppearing {
                    addItem()
                    viewModel.username = ""
                }
            }, usesSymbol: false)
        }.environmentObject(SetupViewModel())
    }

    
    func addItem() {
        let item = Player(name: viewModel.username)
        print(item.name)
        context.insert(item)
        
        viewModel.incrementPlayerCount()
        if viewModel.isPlayerLimitReached() {
            isOver.toggle()
        }
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
    PlayerNameView()
}
