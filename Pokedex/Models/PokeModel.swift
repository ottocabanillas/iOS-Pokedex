//
//  PokeModel.swift
//  Pokedex
//
//  Created by Oscar Cabanillas on 12/04/2022.
//

import Foundation

// MARK: - Pokemon struct
struct Pokemon: Decodable {

  // MARK: - Properties
  let name: String?
  let isLegendary: Bool?
  let image: String?
}

//{
//    "name": "Bayleef",
//    "isLegendary": false,
//    "image": "bayleef.png"
//  },
