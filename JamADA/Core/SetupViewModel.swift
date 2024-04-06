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
    @Published var buttonAppearing: Bool = false
    @Published var numberOfPlayers: Int = 1
    @Published var numberOfRounds: Int = 1
    
    @Published var playerCount: Int = 1

    func buttonAppears() {
        buttonAppearing = !username.isEmpty
    }
    
    func incrementPlayerCount() {
        print(playerCount)
        playerCount += 1
    }
        
    func isPlayerLimitReached() -> Bool {
        return playerCount >= numberOfPlayers + 1
    }
}
