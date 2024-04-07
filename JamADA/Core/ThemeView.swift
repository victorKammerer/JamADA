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
    let width: CGFloat
    let height: CGFloat
    
    init(buttonText: String, icon: String, width: CGFloat = 94, height: CGFloat = 34) {
        self.buttonText = buttonText
        self.icon = icon
        self.width = width
        self.height = height
    }
    
    var body: some View {
        HStack {
            Text(buttonText)
                .font(.system(size: 16, weight: .medium, design: .rounded))
                .kerning(0.5)
            
            Image(systemName: icon)
                .font(.system(size: 16, weight: .semibold, design: .rounded))
                .foregroundStyle(.primary)
            
        }
        .frame(width: self.width, height: self.height)
        .background(Color.theme.gray)
        .foregroundStyle(.black)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    ThemeView(buttonText: "Praia", icon: "balloon.2.fill")
}
