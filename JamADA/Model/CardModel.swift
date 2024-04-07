//
//  CardModel.swift
//  JamADA
//
//  Created by Victor Kammerer on 06/04/24.
//

import Foundation

struct CardData: Codable {
    var theme: String
    var icon: String
    var cards: [String]
}

class CardModel {
    static let shared = CardModel()
    
    var cards: [CardData] = []
    
    init() {
        loadCards()
    }
    
    func loadCards() {
        let beachCards = CardData(theme: "Praia", icon: "figure.open.water.swim", cards: ["Banhista", "Surfista", "Tubarão", "Pescador", "Ambulante", "Salva-vidas"])
        let birthdayCards = CardData(theme: "Festa Infantil", icon: "balloon.2.fill", cards: ["Aniversariante", "Palhaço", "Mágico", "Mãe do Aniversariante", "Criança pulando", "Garçom"])
        let circusCards = CardData(theme: "Circo", icon: "", cards: ["Acrobata", "Malabarista", "Leão", "Domador", "Contorcionista", "Palhaço", "Mágico"])
        let weddingCards = CardData(theme: "Casamento", icon: "heart.fill", cards: ["Padre", "Noivo", "Noiva", "Padrinho", "Daminha de honra", "Amante"])
        let funeralCards = CardData(theme: "Funeral", icon: "", cards: ["Defunto", "Padre", "Coveiro", "Assassino", "Familiar chorando", "Pessoa jogando flor no defunto"])
        
        
        cards = [beachCards, birthdayCards]
    }
}
