//
//  GameVoteResult.swift
//  JamADA
//
//  Created by Lucas Daniel Costa da Silva on 07/04/24.
//

import SwiftUI
import SwiftData

struct GameVoteResult: View {
    
    @State var playerVotes: [Int]
    
    @Environment(\.modelContext) private var context
    
    @Query private var items: [Player]
    
    
    var body: some View {
        VStack{
            
            Text ("Resultado da votação:")
                .font(.system(size: 36, weight: .bold, design: .rounded))
            Spacer()
            Spacer()
            HStack {
                ScrollView(showsIndicators: false) {
                    VStack (alignment: .leading){
                        ForEach (items.indices, id: \.self) { index in
                            Text("\(index + 1)º Jogador(a)")
                                .font(.system(size: 14, weight: .semibold, design: .rounded))
                            
                            Text (items[index].name)
                                .font(.system(size: 20, weight: .bold, design: .rounded))
                            
                            Text ("Votos: \(countOccurrences(of: index+1,  in: playerVotes))")
                                .font(.system(size: 20, weight: .bold, design: .rounded))
                            
                            Divider()
                                .frame(width: 113, height: 1)
                                .overlay(.secondary)
                                .padding(.bottom)
                        }.padding(.horizontal)
                    }.padding()
                }
                Spacer()
            }
        }.padding()
    }
    
    func countOccurrences(of number: Int, in array: [Int]) -> Int {
        var count = 0
        
        // Iterate through the array and count occurrences
        for element in array {
            if element == number {
                count += 1
            }
        }
        
        return count
    }
}

#Preview {
    GameVoteResult(playerVotes: [])
}
