//
//  RectangleButtonView.swift
//  JamADA
//
//  Created by Victor Kammerer on 06/04/24.
//

import SwiftUI

struct RectangleButtonView: View {
    
    let buttonText: String
    let textColor: Color?
    let buttonColor: Color?
    let action: () -> Void
    let usesSymbol: Bool
    
    var body: some View {
        HStack {
            
            Text(buttonText)
                .font(.system(size: 20, weight: .medium, design: .rounded))
                .kerning(0.5)
            
            if usesSymbol {
                Image(systemName: "arrow.right")
                    .font(.system(size: 17, weight: .semibold, design: .rounded))
            }
        }
        .frame(width: 153, height: 50)
        .background(buttonColor ?? Color.black)
        .foregroundStyle(textColor ?? Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 14))
        .onTapGesture {
            withAnimation(.easeInOut) {
                action()
            }
        }
    }
}

#Preview {
    RectangleButtonView(buttonText: "Próximo", textColor: .white, buttonColor: .black, action: {}, usesSymbol: true)
        .previewLayout(.sizeThatFits)
}
