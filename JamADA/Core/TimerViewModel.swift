//
//  TimerViewModel.swift
//  JamADA
//
//  Created by Joao Filipe Reis Justo da Silva on 07/04/24.
//

import SwiftUI

class TimerViewModel: ObservableObject {
    @Published var timerRunning: Bool = false
    @Published var countFrom: Int   // in seconds
    private var originalCountFrom: Int // Store the original countdown time
    private var playerIndex: Int = 0 // Track current player index
    private var isFirstTime: Bool = true // Flag to track first time start
    
    @Published var showPlayerName: Bool = false // Toggle flag to show player's name or placeholder text
    @Published var currentPlayerName: String = "" // Store the current player's name
    
    private var timer: Timer?
    
    var players: [Player]
    
    init(countFrom: Int, players: [Player]){
        self.countFrom = countFrom
        self.originalCountFrom = countFrom
        self.players = players
    }
    
    func resetTimer() {
        countFrom = isFirstTime ? originalCountFrom : 5
    }
    
    func startTimer() {
        isFirstTime = false
        timerRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if self.countFrom > 0 {
                self.countFrom -= 1
            } else {
                self.stopTimer()
            }
            if !self.isFirstTime && self.countFrom % 5 == 0 {
                self.showPlayerName = true // Set flag to show player's name
                self.showNextPlayerName()
            }
        }
    }
    
    func stopTimer() {
        timerRunning = false
        timer?.invalidate()
        playerIndex = 0
    }
    
    func showNextPlayerName() {
        guard !players.isEmpty else { return }
        let currentPlayer = players[playerIndex]
        currentPlayerName = currentPlayer.name // Update currentPlayerName with current player's name
        playerIndex = (playerIndex + 1) % players.count
    }

    func formattedTime() -> String {
        let minutes = Int(self.countFrom) / 60
        let seconds = Int(self.countFrom) % 60
        
        return String(format: "%02d:%02d", minutes, seconds)
    }

}


    
