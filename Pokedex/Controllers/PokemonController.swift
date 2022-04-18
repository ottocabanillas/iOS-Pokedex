//
//  PokemonController.swift
//  Pokedex
//
//  Created by Oscar Cabanillas on 12/04/2022.
//

import UIKit

// MARK: - DetailController class
final class PokemonController: UIViewController {

  // Outlets
  @IBOutlet private weak var nameLabel: UILabel!
  @IBOutlet weak var pokemonImage: UIImageView!
  
  // Variables
  var pokemonName: String?
  var pokeComplete: Pokemon?

  // MARK: - Lifecycle methods
  override func viewDidLoad() {
    super.viewDidLoad()

    setupViewPoke()
//    self.title = pokemonName
//    self.nameLabel.text = pokemonName
  }

  private func setupViewPoke() {
    guard let pokeInfo = pokeComplete else {
      preconditionFailure("Error")
    }
    self.title = pokeInfo.name
    self.nameLabel.text = pokeInfo.name
//    let pokeImg = pokeComplete?.image
// Preguntar a nata
    if (pokeInfo.isLegendary!){
      changeColor(poke: pokeInfo.name!)
    }
    pokemonImage.image = UIImage(named: pokeInfo.image!)
  }

  private func changeColor(poke: String) {
    switch poke {
    case "Lugia":
      self.view.backgroundColor = .lightGray
      self.nameLabel.textColor = .white
      break
    case "Articuno":
      self.view.backgroundColor = .cyan
      self.nameLabel.textColor = .white
      break
    case "Mewtwo":
      self.view.backgroundColor = .purple
      self.nameLabel.textColor = .white
      break
    default:
      self.view.backgroundColor = .white
    }
  }

}
