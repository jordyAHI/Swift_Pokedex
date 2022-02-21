//
//  PokedexView.swift
//  PokeDex_ios
//
//  Created by Jordy Yeoman on 21/2/2022.
//

import SwiftUI

struct PokedexView: View {
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    @StateObject var viewModel = PokemonViewModel()
    var body: some View {
        NavigationView(){
            ScrollView {
                LazyVGrid(columns: gridItems, spacing: 16) {
                    ForEach(viewModel.pokemon) { pokemon in
                        NavigationLink(destination: PokemonDetailsCard(pokemon: pokemon, viewModel: viewModel)) {
                            PokemonCell(pokemon: pokemon, viewModel: viewModel)
                        }
                    }
                }
            }
            .navigationTitle("Pokedex")
        }
    }
}

struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}
