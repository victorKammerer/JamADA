//
//  GameVoteResult.swift
//  JamADA
//
//  Created by Lucas Daniel Costa da Silva on 07/04/24.
//

import SwiftUI
import SwiftData

struct GameVoteResult: View {
  
  @Environment(\.modelContext) private var context
  
  @Query private var players: [Player]
  
  var body: some View {
    VStack{
      Text ("Resultado da votação:")
        .font(.system(size: 36, weight: .bold, design: .rounded))
      Spacer()
      Spacer()
      HStack {
        ScrollView(showsIndicators: false) {
          VStack (alignment: .leading){
            ForEach (players.indices, id: \.self) { index in
              Text("\(index + 1)º Jogador(a)")
                .font(.system(size: 14, weight: .semibold, design: .rounded))
              
              Text (players[index].name)
                .font(.system(size: 20, weight: .bold, design: .rounded))
              
              Text ("Votos: \(players[index].voteCount)")
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
}

#Preview {
  GameVoteResult()
}
