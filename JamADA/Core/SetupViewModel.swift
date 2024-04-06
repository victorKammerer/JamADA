//
//  SetupViewModel.swift
//  JamADA
//
//  Created by Victor Kammerer on 06/04/24.
//

import Foundation
import SwiftUI

class SetupViewModel: ObservableObject {
    
    @Published var username: String = ""
//    @Published var id: Id =
    @Published var buttonAppearing: Bool = false
    @Published var numberOfPlayers: Int = 4
    @Published var numberOfRounds: Int = 1
    
    @Published var playerCount: Int = 1

    func buttonAppears() {
        buttonAppearing = !username.isEmpty
    }
    
    func incrementPlayerCount() {
        playerCount += 1
    }
        
    func isPlayerLimitReached() -> Bool {
        return playerCount >= numberOfPlayers + 1
    }
}
