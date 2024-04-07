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
    
    private var timer: Timer?
    
    init(countFrom: Int){
        self.countFrom = countFrom
    }
    
    func formattedTime() -> String {
        let minutes = Int(self.countFrom) / 60
        let seconds = Int(self.countFrom) % 60
                
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    func startTimer() {
        timerRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {_ in
            if self.countFrom > 0 {
                self.countFrom -= 1
            } else {
                self.stopTimer()
                // do something ?
            }
        }
    }
    
    func stopTimer() {
        timerRunning = false
        timer?.invalidate()
        // countFrom = 15
    }
    
    
    
}
