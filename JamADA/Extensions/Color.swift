//
//  Color.swift
//  JamADA
//
//  Created by Victor Kammerer on 06/04/24.
//

import Foundation
import SwiftUI

// Arquivo para definir as cores customizadas do aplicativo
// Quando for usar uma das cores customizadas, utilizar da forma: Color.theme.gray

extension Color {
  static let theme = ColorTheme()
}

struct ColorTheme {
  
  let gray = Color("gray")
  let gray2 = Color("gray2")
}
