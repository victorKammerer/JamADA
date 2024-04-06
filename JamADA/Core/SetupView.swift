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
                Text("How many players?")
                    .font(.system(size: 32, weight: .bold, design: .rounded))
                
                Spacer()
                
                HStack (alignment: .center){
                    Button("-") {
                        if viewModel.numberOfPlayers > 4 {
                            viewModel.numberOfPlayers -= 1
                        }
                    }.foregroundColor(Color.gray)
                        .font(.system(size: 64, weight: .bold, design: .rounded))
                        .padding()
                    
                    Text("\(viewModel.numberOfPlayers)")
                        .foregroundColor(Color.primary)
                        .font(.system(size: 128, weight: .bold, design: .rounded))
                        .padding()
                        .multilineTextAlignment(.center)
                    
                    
                    Button("+") {
                        if viewModel.numberOfPlayers < 7 {
                            viewModel.numberOfPlayers += 1
                        }
                    }.foregroundColor(Color.gray)
                        .font(.system(size: 64, weight: .bold, design: .rounded))
                        .padding()
                    
                }
                
                Spacer()
                
                Button("Next") {
                    step += 1
                }.padding()
            }
            .padding()
        } else if step == 1 {
            VStack () {
                Text("How many rounds?")
                    .font(.system(size: 32, weight: .bold, design: .rounded))
                
                Spacer()
                
                HStack (alignment: .center){
                    Button("-") {
                        if viewModel.numberOfRounds > 1 {
                            viewModel.numberOfRounds -= 1
                        }
                    }.foregroundColor(Color.gray)
                        .font(.system(size: 64, weight: .bold, design: .rounded))
                        .padding()
                    
                    Text("\(viewModel.numberOfRounds)")
                        .foregroundColor(Color.primary)
                        .font(.system(size: 128, weight: .bold, design: .rounded))
                        .padding()
                        .multilineTextAlignment(.center)
                    
                    Button("+") {
                        if viewModel.numberOfRounds < 10 {
                            viewModel.numberOfRounds += 1
                        }
                    }.foregroundColor(Color.gray)
                        .font(.system(size: 64, weight: .bold, design: .rounded))
                        .padding()
                    
                }
                
                Spacer()
                
                Button("Next") {
                    step += 1
                }.padding()
            }
            .padding()
        } else if step == 2 {
            
            Text("Jogador \(viewModel.playerCount)")
                .font(.title)
                .padding()
            
            playerNameBar
            
            if viewModel.buttonAppearing {
                Button("NEXT") {
                    addItem()
                    viewModel.username = ""
                }
            }
            
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
        
        if viewModel.isPlayerLimitReached() {
            step += 1
        }
    }
}


#Preview {
    SetupView()
}
