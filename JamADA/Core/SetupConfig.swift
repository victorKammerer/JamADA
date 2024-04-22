//
//  SetupConfig.swift
//  JamADA
//
//  Created by Lucas Daniel Costa da Silva on 22/04/24.
//

import Foundation

class SetupConfig: ObservableObject {
  @Published var rounds: Int = 1
  @Published var players: Int = 4
}
