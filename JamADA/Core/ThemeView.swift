//
//  ThemeView.swift
//  JamADA
//
//  Created by Victor Kammerer on 06/04/24.
//

import SwiftUI

struct ThemeView: View {
    
    let buttonText: String
    let icon: String
    
    var body: some View {
        HStack {
            Text(buttonText)
                .font(.system(size: 16, weight: .medium, design: .rounded))
                .kerning(0.5)
            
            Image(systemName: icon)
                .font(.system(size: 16, weight: .semibold, design: .rounded))
            
        }
        .frame(width: 94, height: 34)
        .background(Color.theme.gray)
        .foregroundStyle(.black)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    ThemeView(buttonText: "Praia", icon: "figure.open.water.swim")
}
