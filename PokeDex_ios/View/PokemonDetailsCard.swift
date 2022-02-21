//
//  PokemonDetailsCard.swift
//  PokeDex_ios
//
//  Created by Jordy Yeoman on 21/2/2022.
//

import SwiftUI
import Kingfisher

struct PokemonDetailsCard: View {
    let pokemon: Pokemon
    let viewModel: PokemonViewModel
    let backgroundColor: Color
    
    init(pokemon: Pokemon, viewModel: PokemonViewModel){
        self.pokemon = pokemon
        self.viewModel = viewModel
        self.backgroundColor = Color(pokemon.typeColor)
    }
    
    var body: some View {
        VStack {
            KFImage(URL(string: pokemon.imageUrl))
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .padding([.bottom, .trailing], 4)
            HStack {
                    Text(pokemon.name)
                        .font(.largeTitle)
                    HStack{
                        //                        Image(systemName: "leaf")
                        Text(pokemon.type)
                    }
                    .font(.title)
                    .foregroundColor(Color.gray)
            }
            Text(pokemon.description)
                .frame(maxWidth: .infinity)
                .font(.caption)
                .foregroundColor(Color.white)
                .padding()
                .background(Color(pokemon.typeColor).opacity(0.6))
                .cornerRadius(20)
                .padding(.horizontal)
            Text("Stats")
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 20)
            VStack(spacing: 10){
                HStack{
                    Text("Attk: \(pokemon.attack)")
                        .frame(width: 100)
                    ZStack {
                        Capsule()
                            .fill(Color.red.opacity(0.25))
                            .frame(height: 20)
                        Capsule()
                            .fill(Color.red)
                            .frame(width: 50, height: 20)
                    }
                }
                HStack{
                    Text("Defense: \(pokemon.defense)")
                        .frame(width: 100)
                    Capsule()
                        .fill(Color.blue)
                        .frame(height: 20)
                }
                HStack{
                    Text("Weight: \(pokemon.weight)")
                        .frame(width: 100)
                    Capsule()
                        .fill(Color.indigo)
                        .frame(height: 20)
                }
                HStack{
                    Text("Height: \(pokemon.height)")
                        .frame(width: 100)
                    Capsule()
                        .fill(Color.orange)
                        .frame(height: 20)
                }
                HStack{
                    Text("Total")
                        .frame(width: 100)
                    Capsule()
                        .fill(Color.green)
                        .frame(height: 20)
                }
            }
        }
        .padding()
        .background(Color(pokemon.typeColor).opacity(0.2))
        .cornerRadius(20)
        .padding()
    }
}

