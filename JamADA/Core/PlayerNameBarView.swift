//
//  PlayerNameBarView.swift
//  JamADA
//
//  Created by Victor Kammerer on 06/04/24.
//

import SwiftUI

extension SetupView {
    
    var playerNameBar: some View {
        TextField(
            "",
            text: $viewModel.username,
            prompt: Text("Enter your name...")
                .font(.system(size: 32, weight: .regular, design: .rounded))
            
        )
        .foregroundColor(Color.primary)
        .font(.system(size: 32, weight: .bold, design: .rounded))
        .padding()
        .frame(alignment: .center)
        .multilineTextAlignment(.center)
        .onChange(of: viewModel.username) { _ in
            viewModel.buttonAppears()
            
        }
    }
}


