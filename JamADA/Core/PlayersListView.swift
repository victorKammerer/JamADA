//
//  PlayersListView.swift
//  JamADA
//
//  Created by Victor Kammerer on 06/04/24.
//

import SwiftUI
import SwiftData

struct PlayersListView: View {
    
    @Environment(\.modelContext) private var context

    @Query private var items: [Player]
    
    @State private var nextView: Bool = false
    
    @StateObject var viewModel = SetupViewModel()
    
    var body: some View {
        Text("Nomeie os jogadores")
            .font(.system(size: 32, weight: .bold, design: .rounded))
            .padding()
        
        Spacer()
        
        HStack {
            ScrollView(showsIndicators: false) {
                VStack (alignment: .leading){
                    ForEach (items.indices, id: \.self) { index in
                        Text("\(index + 1)º Jogador(a)")
                            .font(.system(size: 14, weight: .semibold, design: .rounded))
        
                        Text (items[index].name)
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                        
                        Divider()
                            .frame(width: 113, height: 1)
                            .overlay(.black)
                            .padding(.bottom)
                    }.padding(.horizontal)
                }.padding()
            }
            Spacer()
        }
        
        Spacer()
        
        NavigationLink(destination: PlayersListView().navigationBarBackButtonHidden(),
                       isActive: $nextView) {
            EmptyView()
        }
        .hidden()
        
        RectangleButtonView(
            buttonText: "Criar partida",
            textColor: nil,
            buttonColor: nil,
            action: {
                UIView.setAnimationsEnabled(false)
                nextView = true
            }, usesSymbol: false)
    }
}

#Preview {
    PlayersListView()
}
