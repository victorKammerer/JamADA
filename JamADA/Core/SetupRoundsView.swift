//
//  SetupRoundsView.swift
//  JamADA
//
//  Created by Victor Kammerer on 06/04/24.
//

import SwiftUI

struct SetupRoundsView: View {
  
  @StateObject var viewModel = SetupViewModel()
  @State private var nextView: Bool = false
  
  var body: some View {
    NavigationStack {
      VStack () {
        Text("Quantas rodadas?")
          .font(.system(size: 32, weight: .bold, design: .rounded))
          .padding()
        
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
        
        NavigationLink(destination: PlayerNameView(viewModel: viewModel),
                       isActive: $nextView) {
          
          EmptyView()
        }
                       .hidden()
        
        RectangleButtonView(buttonText: "Próximo", textColor: nil, buttonColor: nil, action: {
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
  SetupRoundsView()
}
