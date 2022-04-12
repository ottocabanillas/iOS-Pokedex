//
//  Provider.swift
//  Pokedex
//
//  Created by Oscar Cabanillas on 12/04/2022.
//

import Foundation

// MARK: PokemonProvider class
final class PokemonProvider {
  
  // MARK: - Methods
  func getPokemons() -> [Pokemon] {
    return [Pokemon(name: "Pikachu"), Pokemon(name: "Mew"), Pokemon(name: "MewTwo"), Pokemon(name: "Eevee"), Pokemon(name: "Lucario"), Pokemon(name: "Dugtrio"), Pokemon(name: "Magikarp")].sorted { (pokeA, pokeB) -> Bool in
      return pokeA.name! < pokeB.name!
    }
  }
  
}

// MARK: - Helper struct
struct Helper {

  // MARK: - Methods
  static func loadJSON(name: String, from bundle: Bundle = Bundle.main) -> Data {
    guard let url = bundle.url(forResource: name, withExtension: "json") else {
      fatalError("Could not load file named: \(name)")
    }

    guard let data = try? Data(contentsOf: url) else {
      fatalError("Could not read data from file")
    }

    return data
  }
}
