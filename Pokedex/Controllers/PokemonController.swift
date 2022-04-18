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
    self.title = pokeComplete?.name
    self.nameLabel.text = pokeComplete?.name
    let pokeImg = pokeComplete?.image
// Preguntar a nata
    if (pokeComplete!.isLegendary!){
      changeColor(poke: pokeComplete!.name!)
    }
    pokemonImage.image = UIImage(named: pokeImg!)
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
