//
//  VoteOptionView.swift
//  JamADA
//
//  Created by Lucas Daniel Costa da Silva on 06/04/24.
//

import SwiftUI

struct VoteOptionView: View {
    
    var playerName: String
    
    var isClicked: Bool
    
    var action: () -> Void
    
    var body: some View {

            HStack {
                Text(playerName)
                    .font(.system(size: 20, weight: .medium, design: .rounded))
                    .kerning(0.5)
                    .padding()
                Spacer ()
            }
            .frame(width: 336, height: 50)
            .background(isClicked ? .white : .black)
            .cornerRadius(12)
            .background(RoundedRectangle(cornerRadius: 12.0).stroke(.white, lineWidth: 1))
            .foregroundColor(isClicked ? .black : .white)
            .padding(.horizontal)
            .onTapGesture {
                withAnimation(.easeInOut) {
                    action()
                }
            }
    }
}

#Preview {
    VoteOptionView(playerName: "Mickaelhy", isClicked: false, action: {})
}
