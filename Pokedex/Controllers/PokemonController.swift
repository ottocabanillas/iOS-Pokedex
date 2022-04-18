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

    guard let pokeInfo = self.pokeComplete else {
      preconditionFailure("A pokemon has to be setted")
    }
    self.title = pokeInfo.name
    self.nameLabel.text = pokeInfo.name
//    let pokeImg = pokeComplete?.image
// Preguntar a nata
    self.view.backgroundColor = pokeInfo.isLegendary! ? .systemPurple : .lightGray
    pokemonImage.translatesAutoresizingMaskIntoConstraints = false
    pokemonImage.contentMode = .scaleAspectFit
    pokemonImage.image = UIImage(named: pokeInfo.image!)
  }

}
