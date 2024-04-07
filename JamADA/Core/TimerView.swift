//
//  StartTimerView.swift
//  JamADA
//
//  Created by Joao Filipe Reis Justo da Silva on 06/04/24.
//

import SwiftUI

struct TimerView: View {
    @StateObject private var viewModel: TimerViewModel
    
    let players: [Player]
    let countFrom: Int
    
    init(players: [Player], countFrom: Int) {
        self.players = players
        self._viewModel = StateObject(wrappedValue: TimerViewModel(countFrom: countFrom, players: players))
        self.countFrom = countFrom
    }
    
    var body: some View {
        VStack {
            Spacer()
            
            if viewModel.showPlayerName {
                Text("Hora da espiadinha")
                    .font(.system(size: 32, weight: .bold, design: .rounded))
                    .padding()
            } else {
                Text("Nas suas posições")
                    .font(.system(size: 32, weight: .bold, design: .rounded))
                    .padding()
            }
            
            Text(viewModel.formattedTime())
                .font(.system(size: 96, weight: .heavy, design: .rounded))
            
            RectangleButtonView(
                buttonText: viewModel.timerRunning ? "Stop" : "Start",
                textColor: nil,
                buttonColor: nil,
                action: {
                    viewModel.timerRunning.toggle()
                    if viewModel.timerRunning {
                        viewModel.resetTimer()
                        viewModel.startTimer()
                    } else {
                        viewModel.stopTimer()
                    }
                },
                usesSymbol: false
            )
            
            Spacer()
        }
    }
}

#Preview {
    TimerView(players: [], countFrom: 5)
}
    
