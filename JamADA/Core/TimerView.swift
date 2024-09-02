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
      if viewModel.isFirstTime {
        Text("Cada um no seu lugar!") // Display placeholder text during the first 15 seconds
          .font(.system(size:24, weight: .semibold, design: . rounded))
      } else if viewModel.displayPlayerName {
        Text("\(viewModel.currentPlayerName)") // Display player's name during 5-second intervals
          .font(.headline)
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
          }  else {
            viewModel.stopTimer()
          }
        },
        usesSymbol: false
      )
      Spacer()
      NavigationLink(destination: GameVoteView(selectedPlayer: nil).navigationBarBackButtonHidden(), isActive: $viewModel.lastPlayer){
        EmptyView()
      }.hidden()
    }
  }
}


#Preview {
  TimerView(players: [], countFrom: 5)
}
