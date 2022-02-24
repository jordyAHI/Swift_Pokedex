//
//  Pokemon.swift
//  PokeDex_ios
//
//  Created by Jordy Yeoman on 21/2/2022.
//

import SwiftUI

struct Pokemon: Decodable, Identifiable {
    let id: Int
    let name: String
    let imageUrl: String
    let type: String
    let description: String
    let height: Int
    let attack: Int
    let defense: Int
    let weight: Int
    //    let total: Int
}

extension Pokemon {
    var typeColor: UIColor {
        get {
            switch type {
            case "fire": return .systemRed
            case "poision": return .systemGreen
            case "water": return .systemBlue
            case "electric": return .systemYellow
            case "psychic": return .systemPurple
            case "normal": return .systemOrange
            case "ground": return .systemGray
            case "flying": return .systemTeal
            case "fairy": return .systemPink
            default: return .systemIndigo
            }
        }
    }
    
    var total: Int {
        get {
            return (height + weight + attack + defense)/4
        }
    }
}

let MOCK_POKEMON : [Pokemon] = [
    Pokemon(id: 1, name: "Sabrimon", imageUrl: "1", type: "water", description: "Loves to play at the beach for years on end", height: 200, attack: 10, defense: 200, weight: 10)
]
