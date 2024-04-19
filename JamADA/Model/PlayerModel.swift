//
//  PlayerModel.swift
//  JamADA
//
//  Created by Victor Kammerer on 06/04/24.
//

import Foundation
import SwiftData

@Model
class Player: Identifiable {
  
  var id: String
  var name: String
  var card: String?
  var voteCount: Int = 0
  
  init(name: String, voteCount: Int = 0) {
    self.id = UUID().uuidString
    self.name = name
    self.voteCount = voteCount
  }
}
