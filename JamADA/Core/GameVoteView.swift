//
//  GameVoteView.swift
//  JamADA
//
//  Created by Lucas Daniel Costa da Silva on 07/04/24.
//

import SwiftUI
import SwiftData

struct GameVoteView: View {
    @Environment(\.modelContext) private var context
    
    @Query private var items: [Player]
    
    @State var playerTurnVote: Int
    
    @State var votedPlayer: [Bool]
    
    @State var votedPlayers: [Int]
    
    @State var playerSelected: Int = 0
    
    @StateObject var gameViewModel = GameViewModel(players: [], theme: "", icon: "")
    
    @State private var nextView: Bool = false
    
    var body: some View {
        VStack(spacing: 24) {
            
            ThemeView(buttonText: "Votação", icon: "target", width: 116, height: 34)
            
            Text("\(playerTurnVote + 1)º Jogador(a)").font(.system(size: 16, weight: .medium, design: .rounded))
            
            Text("\(mostRepeatedNumber(in: votedPlayers) ?? 0)")
            
            Text(items[playerTurnVote].name).font(.system(size: 24, weight: .medium, design: .rounded))
            
            VStack(spacing: 16) {
                
                ForEach (items.indices, id: \.self) { index in
                    let item = items[index]
                    VoteOptionView(playerName: item.name, isClicked: votedPlayer[index], action: {
                        UIView.setAnimationsEnabled(false)
                        votedPlayer[index].toggle()
                        playerSelected = index+1
                    })
                }
            }
            Spacer()
            RectangleButtonView(buttonText: "Confirmar", textColor: nil, buttonColor: nil, action: {
                UIView.setAnimationsEnabled(false)
                votedPlayers.append(playerSelected)
                nextView = true
            }, usesSymbol: false)
            Spacer()
        }
        
        NavigationLink(destination: items.count > playerTurnVote + 1 ? AnyView(GameVoteView(playerTurnVote: playerTurnVote + 1, votedPlayer: [Bool](repeating: false, count: items.count), votedPlayers: votedPlayers)) : AnyView(GameVoteResult(playerVotes: votedPlayers)), isActive: $nextView) {
            EmptyView()
        }.hidden()
    }}

    func mostRepeatedNumber(in array: [Int]) -> Int? {
            var frequencyDictionary = [Int: Int]()

            // Count the frequency of each number
            for number in array {
                frequencyDictionary[number, default: 0] += 1
            }

            // Find the number with the highest frequency
            var mostRepeatedNumber: Int?
            var maxFrequency = 0

            for (number, frequency) in frequencyDictionary {
                if frequency > maxFrequency {
                    maxFrequency = frequency
                    mostRepeatedNumber = number
                }
            }

            return mostRepeatedNumber
        }

#Preview {
    GameVoteView(playerTurnVote: 0, votedPlayer: [Bool](repeating: false, count: 4), votedPlayers: [])
}
