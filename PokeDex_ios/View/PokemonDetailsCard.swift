//
//  PokemonDetailsCard.swift
//  PokeDex_ios
//
//  Created by Jordy Yeoman on 21/2/2022.
//

import SwiftUI
import Kingfisher

struct PokemonDetailsCard: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(
      // 2
      entity: FavouritePokemon.entity(),
      // 3
      sortDescriptors: []
    // 4
    ) var favouritePokemonData: FetchedResults<FavouritePokemon>
    let pokemon: Pokemon
    @ObservedObject var viewModel: PokemonViewModel
    @State var heartTap = false
    @State var pillsTap = false
    @State var ecgTap = false
    let backgroundColor: Color
    
    init(pokemon: Pokemon, viewModel: PokemonViewModel){
        self.pokemon = pokemon
        self.viewModel = viewModel
        self.backgroundColor = Color(pokemon.typeColor)
    }
    
    func addFavouritePokemon(name: String){
        let favouritePokemon = FavouritePokemon(context: moc)
        favouritePokemon.id = UUID()
        favouritePokemon.pokemonName = name
        print("Pokemon name is: \(name)")
        saveContext()
    }
    
//    func removeFavouritePokemon(name: String) {
//        let favouritePokemon = FavouritePokemon(context: moc)
//        
//    }
    
    func saveContext() {
      do {
        try moc.save()
      } catch {
        print("Error saving managed object context: \(error)")
      }
    }
    
    var body: some View {
        ScrollView {
            VStack {
                KFImage(URL(string: pokemon.imageUrl))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .padding([.bottom, .trailing], 4)
                HStack {
                    VStack {
                        Text(pokemon.name)
                            .font(.largeTitle)
                        HStack{
                            //                        Image(systemName: "leaf")
                            Text(pokemon.type)
                        }
                        .font(.title)
                        .foregroundColor(Color.gray)
                    }
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
                            .frame(width: 100, alignment: .leading)
                        ZStack(alignment: .leading) {
                            Capsule()
                                .fill(Color.red.opacity(0.25))
                                .frame(height: 20)
                            Capsule()
                                .fill(Color.red)
                                .frame(width: CGFloat(pokemon.attack), height: 20)
                        }
                    }
                    HStack{
                        Text("Defense: \(pokemon.defense)")
                            .frame(width: 100, alignment: .leading)
                        ZStack(alignment: .leading) {
                            Capsule()
                                .fill(Color.blue.opacity(0.25))
                                .frame(height: 20)
                            Capsule()
                                .fill(Color.blue)
                                .frame(width: CGFloat(pokemon.defense), height: 20)
                        }
                    }
                    HStack{
                        Text("Weight: \(pokemon.weight)")
                            .frame(width: 100, alignment: .leading)
                        ZStack(alignment: .leading) {
                            Capsule()
                                .fill(Color.indigo.opacity(0.25))
                                .frame(height: 20)
                            Capsule()
                                .fill(Color.indigo)
                                .frame(width: CGFloat(pokemon.weight), height: 20)
                        }
                    }
                    HStack{
                        Text("Height: \(pokemon.height)")
                            .frame(width: 100, alignment: .leading)
                        ZStack(alignment: .leading) {
                            Capsule()
                                .fill(Color.orange.opacity(0.25))
                                .frame(height: 20)
                            Capsule()
                                .fill(Color.orange)
                                .frame(width: CGFloat(pokemon.attack), height: 20)
                        }
                    }
                    HStack{
                        Text("Total: \(pokemon.total)")
                            .frame(width: 100, alignment: .leading)
                        ZStack(alignment: .leading) {
                            Capsule()
                                .fill(Color.green.opacity(0.25))
                                .frame(height: 20)
                            Capsule()
                                .fill(Color.green)
                                .frame(width: CGFloat(pokemon.total), height: 20)
                        }
                    }
                }
            }
//            .padding()
            .background(Color(pokemon.typeColor).opacity(0.2))
            .cornerRadius(20)
            .overlay(
                ZStack {
                    VStack(spacing: 15) {
                        Button {
                            if(heartTap) {
                                    print("Heart Tapped")
//                                removeFavouritePokemon(name: pokemon.name)
                            } else {
                                addFavouritePokemon(name: pokemon.name)
                            }
                            heartTap = !heartTap
                        } label: {
                            Image(systemName: heartTap ? "heart.fill" : "heart")
                                .font(.title3)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                        Button {
                            pillsTap = !pillsTap
                        } label: {
                            Image(systemName: pillsTap ? "pills.fill" : "pills")
                                .font(.title3)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                        Button {
                            ecgTap = !ecgTap
                        } label: {
                            Image(systemName: ecgTap ? "waveform.path.ecg.rectangle.fill" : "waveform.path.ecg.rectangle")
                                .font(.title3)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                    }
                }
                    .padding([.top, .trailing], 25)
                    .frame(height: 100)
                    .frame(maxHeight: .infinity, alignment: .top)
            )
//            .padding()
        }
    }
}

struct PokemonDetailsCard_Previews: PreviewProvider {
    
    static var previews: some View {
        PokemonDetailsCard(pokemon: MOCK_POKEMON[0], viewModel: PokemonViewModel())
    }
}

