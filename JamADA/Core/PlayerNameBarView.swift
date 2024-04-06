//
//  PlayerNameBarView.swift
//  JamADA
//
//  Created by Victor Kammerer on 06/04/24.
//

import SwiftUI

extension PlayerNameView {
    
    var playerNameBar: some View {
        TextField(
            "",
            text: $viewModel.username,
            prompt: Text("Inserir nome")
                .font(.system(size: 32, weight: .medium, design: .rounded))
            
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


