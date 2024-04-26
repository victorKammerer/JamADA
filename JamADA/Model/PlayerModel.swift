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
  var isActualImpersonator: Bool = false
  
  init(name: String, voteCount: Int = 0, isActualImpersonator: Bool = false) {
    self.id = UUID().uuidString
    self.name = name
    self.voteCount = voteCount
    self.isActualImpersonator = isActualImpersonator
  }
}
