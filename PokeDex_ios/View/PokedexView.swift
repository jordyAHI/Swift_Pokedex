//
//  PokedexView.swift
//  PokeDex_ios
//
//  Created by Jordy Yeoman on 21/2/2022.
//

import SwiftUI

struct PokedexView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(
      // 2
      entity: UserData.entity(),
      // 3
      sortDescriptors: []
    // 4
    ) var userData: FetchedResults<UserData>
    
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    private let gridItemsThreeColumn = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    @StateObject var viewModel = PokemonViewModel()
    var body: some View {
        NavigationView(){
            ScrollView {
                Button("Add") {
                    let firstNames = ["Ginny", "Harry", "Hermoine", "Luna", "Ron"]
                    let lastNames = ["Ginny", "Harry", "Hermoine", "Luna", "Ron"]

                    let chosenFirstName = firstNames.randomElement()!
                    let chosenLastName = lastNames.randomElement()!

                    let userData = UserData(context: moc)
                    userData.id = UUID()
                    userData.type = "Fire"
                    userData.name = "\(chosenFirstName) \(chosenLastName)"
//                    print(userData)
                    try? moc.save()
                }
                LazyVGrid(columns: gridItems, spacing: 16) {
                    ForEach(viewModel.pokemon) { pokemon in
                        NavigationLink(destination: PokemonDetailsCard(pokemon: pokemon, viewModel: viewModel)) {
                            PokemonCell(pokemon: pokemon, viewModel: viewModel)
                        }
                    }
                }
                LazyVGrid(columns: gridItemsThreeColumn, spacing: 16) {
                    ForEach(userData, id: \.id) { user in
                        Text(user.name ?? "No Name bra")
                            .font(.caption2)
                    }
                }
                .padding()
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
