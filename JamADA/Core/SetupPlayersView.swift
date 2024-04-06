//
//  SetupView.swift
//  JamADA
//
//  Created by Victor Kammerer on 06/04/24.
//

import SwiftUI

struct SetupPlayersView: View {
    
    @StateObject var viewModel = SetupViewModel()
    @State private var nextView: Bool = false
    
    @State var isActive = false
    
    var body: some View {
        NavigationStack{
            VStack () {
                Text("Quantos Jogadores?")
                    .font(.system(size: 32, weight: .bold, design: .rounded))
                    .padding()
                
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
                        .font(.system(size: 128, weight: .heavy, design: .rounded))
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
                
                NavigationLink(destination: SetupRoundsView().navigationBarBackButtonHidden(), 
                               isActive: $nextView) {
                    EmptyView()
                }.transition(.opacity)
                    .hidden()
                
                RectangleButtonView(buttonText: "Próximo", textColor: nil, buttonColor: Color.black, action: {
                    UIView.setAnimationsEnabled(false)
                    nextView = true
                }, usesSymbol: true)
                .padding()
            }
            .padding()
        }
    }
}


#Preview {
    SetupPlayersView()
}
