//
//  StartTimerView.swift
//  JamADA
//
//  Created by Joao Filipe Reis Justo da Silva on 06/04/24.
//

import SwiftUI

struct TimerView: View {
    @StateObject private var viewModel: TimerViewModel = TimerViewModel(countFrom: 15) // Initialize viewModel
    @State private var title: String = "Nas suas posições!" // Initialize title
    
    let countFrom: Int
    
    let players: [Player]
    
    var body: some View {
        VStack {
            Spacer()
            
            Text(title)
                .font(.system(size: 32, weight: .bold, design: .rounded))
                .padding()
            
            Spacer()
            
            Text(viewModel.formattedTime())
                .font(.system(size: 96, weight: .heavy, design: .rounded))
            
            Spacer()
            
            RectangleButtonView(
                buttonText: viewModel.timerRunning ? "Parar" : "Iniciar",
                textColor: nil,
                buttonColor: nil,
                action: {
                    viewModel.timerRunning.toggle()
                    if viewModel.timerRunning {
                        viewModel.startTimer(countFrom: 5)
                    } else {
                        // viewModel.stopTimer()
                        // do some action or change view
                    }
                }, usesSymbol: false)
                .padding()
            
            Spacer()
        }
    }
}

#Preview {
    TimerView(countFrom: 15, players: [])
}
