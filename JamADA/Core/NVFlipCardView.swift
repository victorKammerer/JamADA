//
//  NVFlipCardView.swift
//  JamADA
//
//  Created by Victor Kammerer on 06/04/24.
//

import SwiftUI

struct NVFlipCardView: View {
    
    @ObservedObject var presenter: NVFlipCardPresenter
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(presenter.isFlipped ? .red : .black)
                .cornerRadius(8)
                .frame(width: 300, height: 450)
                .shadow(color: .gray, radius: 10)
                .onTapGesture {
                    presenter.flipButtonTapped()
                }
                .rotation3DEffect(.degrees(presenter.isFlipped ? 180 : 0), axis: (x: 0, y: 1, z: 0))
                .animation(.default, value: presenter.isFlipped)
            Text(presenter.isFlipped ? "Impostor" : "Revele sua carta")
                .foregroundStyle(presenter.isFlipped ? .black : .white)
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
    NVFlipCardView(presenter: NVFlipCardPresenter())
}
