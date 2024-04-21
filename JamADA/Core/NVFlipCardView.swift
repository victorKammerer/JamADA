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
      Image(themeName)
        .resizable()
        .aspectRatio(contentMode: .fill)
        .cornerRadius(8)
        .frame(width: 300, height: 450)
        .shadow(color: .gray, radius: 10)
        .onTapGesture {
          presenter.flipButtonTapped()
        }
        .rotation3DEffect(.degrees(presenter.isFlipped ? 180 : 0), axis: (x: 0, y: 1, z: 0))
        .animation(.default, value: presenter.isFlipped)
      
      Image(cardName)
        .resizable()
        .aspectRatio(contentMode: .fill)
        .cornerRadius(8)
        .scaleEffect(x: -1, y: 1)
        .frame(width: 300, height: 450)
        .shadow(color: .gray, radius: 10)
        .onTapGesture {
          presenter.flipButtonTapped()
        }
        .opacity(presenter.isFlipped ? 1 : 0) // Show themeName only when flipped
        .rotation3DEffect(.degrees(presenter.isFlipped ? 180 : 0), axis: (x: 0, y: 1, z: 0)) // Counteract card rotation
        .animation(.default, value: presenter.isFlipped)
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
