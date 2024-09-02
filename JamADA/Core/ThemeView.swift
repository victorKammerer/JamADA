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
  
  init(buttonText: String, icon: String) {
    self.buttonText = buttonText
    self.icon = icon
  }
  
  var body: some View {
    HStack {
      Text(buttonText)
        .font(.system(size: 16, weight: .medium, design: .rounded))
        .kerning(0.5)
      
      Image(systemName: icon)
        .font(.system(size: 16, weight: .semibold, design: .rounded))
        .foregroundStyle(.black)
      
    }
    .padding()
    .background(Color.theme.gray, in: Capsule())
    .foregroundStyle(.black)
    .clipShape(RoundedRectangle(cornerRadius: 8))
  }
}

#Preview {
  ThemeView(buttonText: "Praia", icon: "balloon.2.fill")
}
