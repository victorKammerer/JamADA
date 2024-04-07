//
//  StartTimerView.swift
//  JamADA
//
//  Created by Joao Filipe Reis Justo da Silva on 06/04/24.
//

import SwiftUI

struct TimerView: View {
    @StateObject private var viewModel: TimerViewModel
    @State private var title: String
    @State var countFrom: Int
    
    
    init(title: String, countFrom: Int){
        self._viewModel = StateObject(wrappedValue: TimerViewModel(countFrom: countFrom)) // Initialize viewModel
        self._title = State(initialValue: title) // Initialize title
        self.countFrom = countFrom
    }
    
    
    var body: some View {
        VStack{
            Spacer()
            
            Text(title)
                .font(.system(size: 32, weight: .bold, design: .rounded))
                .padding()
            
            Spacer()
            Spacer()
            Spacer()
            
            Text(viewModel.formattedTime())
                .font(.system(size: 96, weight: .heavy, design: .rounded))
            
            Spacer()
            Spacer()
            Spacer()
            
            RectangleButtonView(
                buttonText: "Iniciar",
                textColor: nil,
                buttonColor: nil,
                action: {
                    viewModel.timerRunning.toggle()
                    if viewModel.timerRunning {
                        viewModel.startTimer()
                    } else {
                        // viewModel.stopTimer()
                        // do some action or change view
                    }
                }, usesSymbol: false).padding()
            
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Spacer()
        }
    }
}


#Preview {
    TimerView(title: "Nas suas posições!", countFrom: 15)
}
