//
//  StartTimerView.swift
//  JamADA
//
//  Created by Joao Filipe Reis Justo da Silva on 06/04/24.
//

import SwiftUI

struct StartTimerView: View {
    
    @State private var countFrom: Int = 250 // in seconds
    @State private var timerRunning: Bool = false
    @State private var timer: Timer?
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        VStack{
            Spacer()
            
            Text("Nas suas posições!")
                .font(.system(size: 32, weight: .bold, design: .rounded))
                .padding()
            
            Spacer()
            Spacer()
            Spacer()
            
            Text(formattedTime())
                .font(.system(size: 96, weight: .heavy, design: .rounded))
            
            Spacer()
            Spacer()
            Spacer()
            
            RectangleButtonView(
                buttonText: "Iniciar",
                textColor: nil,
                buttonColor: nil,
                action: {
                    timerRunning.toggle()
                    if timerRunning {
                        startTimer()
                    } else {
                        stopTimer()
                        // do some action or change view
                    }
                }, usesSymbol: false)
                    .padding()
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Spacer()
        }
    }
    
    private func formattedTime() -> String {
        let minutes = Int(countFrom) / 60
        let seconds = Int(countFrom) % 60
        
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {_ in
            if countFrom > 0 {
                countFrom -= 1
            } else {
                stopTimer()
            }
        }
    }
    
    private func stopTimer() {
        timerRunning = false
        timer?.invalidate()
        // countFrom = 15
    }
}

#Preview {
    StartTimerView()
}
