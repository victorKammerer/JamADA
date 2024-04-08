//
//  PlayerVoteView.swift
//  JamADA
//
//  Created by Lucas Daniel Costa da Silva on 06/04/24.
//

import SwiftUI
import SwiftData

struct PlayerVoteView: View {
    
    @Environment(\.modelContext) private var context

    @Query private var items: [Player]
    
    @State var isClicked: Bool = false
    
    @StateObject var viewModel = SetupViewModel()
    
    var body: some View {
        VStack(spacing: 24) {
            ThemeView(buttonText: "Votação", icon: "target", width: 116, height: 34)
            
            Text("1º Jogador(a)").font(.system(size: 16, weight: .medium, design: .rounded))
            
            Text("Mickahayellyh").font(.system(size: 24, weight: .medium, design: .rounded))
            
            VStack(spacing: 16) {
                
                ForEach (items, id: \.self) { index in
                    VoteOptionView(playerName: index.name, isClicked: isClicked, action: {
                        UIView.setAnimationsEnabled(false)
                        isClicked.toggle()
                    })
                }
//                VoteOptionView(playerName: "Mickalehy", isClicked: isClicked, action: {
//                    UIView.setAnimationsEnabled(false)
//                    isClicked.toggle()
//                })
//                VoteOptionView(playerName: "Jogador 2", isClicked: isClicked, action: {
//                    UIView.setAnimationsEnabled(false)
//                    isClicked.toggle()
//                })
//                VoteOptionView(playerName: "Mickalehy", isClicked: isClicked, action: {
//                    UIView.setAnimationsEnabled(false)
//                    isClicked.toggle()
//                    
//                })
//                VoteOptionView(playerName: "Jogador 2", isClicked: isClicked, action: {
//                    UIView.setAnimationsEnabled(false)
//                    isClicked.toggle()
//                })
//                VoteOptionView(playerName: "Mickalehy", isClicked: isClicked, action: {
//                    UIView.setAnimationsEnabled(false)
//                    isClicked.toggle()
//                })
//                VoteOptionView(playerName: "Jogador 2", isClicked: isClicked, action: {
//                    UIView.setAnimationsEnabled(false)
//                    isClicked.toggle()
//                })
            }
            Spacer()
            RectangleButtonView(buttonText: "Confirmar", textColor: Color.white, buttonColor: Color.black, action: {
                UIView.setAnimationsEnabled(false)
            }, usesSymbol: false)
            Spacer()
        }
    }
}

#Preview {
    PlayerVoteView()
}
