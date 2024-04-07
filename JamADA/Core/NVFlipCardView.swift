//
//  NVFlipCardView.swift
//  JamADA
//
//  Created by Victor Kammerer on 06/04/24.
//

import SwiftUI

struct NVFlipCardView: View {
    
    let cardName: String
    let themeName: String
    
    @ObservedObject var presenter: NVFlipCardPresenter
    
    var body: some View {
        ZStack {
            Image(presenter.isFlipped ? "frontCard" : themeName)
                .cornerRadius(8)
                .frame(width: 300, height: 450)
                .shadow(color: .gray, radius: 10)
                .onTapGesture {
                    presenter.flipButtonTapped()
                }
                .rotation3DEffect(.degrees(presenter.isFlipped ? 180 : 0), axis: (x: 0, y: 1, z: 0))
                .animation(.default, value: presenter.isFlipped)
                .overlay(
                    Text(presenter.isFlipped ? cardName : "")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(.black)
                                .mask(
                                    Rectangle()
                                        .frame(width: 300, height: 450)
                                )
                        )
//            Text(presenter.isFlipped ? cardName : "")
//                .foregroundStyle(presenter.isFlipped ? .black : .white)
        }
    }
}

protocol NVFlipCardPresenterProtocol: ObservableObject {
    var isFlipped: Bool { get }
    func flipButtonTapped()
}

class NVFlipCardPresenter: NVFlipCardPresenterProtocol {
    @Published var isFlipped: Bool = false

    func flipButtonTapped() {
        isFlipped.toggle()
    }
}

#Preview {
    NVFlipCardView(cardName: "Impostor", themeName: "Praia", presenter: NVFlipCardPresenter())
}
