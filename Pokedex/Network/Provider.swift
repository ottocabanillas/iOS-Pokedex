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
  func getPokemons(_ completion: @escaping ([Pokemon]) -> Void) {

    guard let url: URL = URL(string: "https://gist.githubusercontent.com/OttoCab/94a4d63b8937b5bcface0a0ff3ba12aa/raw/7d193edbe5ae9a90048de2f5990cb30200dd6e87/pokeList") else {
      
      preconditionFailure("Invalid URL string")
    }

    let request: URLRequest = URLRequest(url: url)
    let configuration: URLSessionConfiguration = .default
    let session: URLSession = URLSession(configuration: configuration)

    let task: URLSessionDataTask = session.dataTask(with: request) { (data, _, error) in
      guard error == nil, let data = data else {
        preconditionFailure("Task error \(error?.localizedDescription ?? "")")
      }

      do {

        let decoder: JSONDecoder = JSONDecoder()
        let pokemons: [Pokemon] = try decoder.decode([Pokemon].self, from: data)
        return completion(pokemons.sorted { (pokeA, pokeB) -> Bool in
          return pokeA.name! < pokeB.name!
        })
      } catch {

        preconditionFailure(error.localizedDescription)
      }
    }

    task.resume()
  }
}

