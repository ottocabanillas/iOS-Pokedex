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
  
  // Variables
  var pokemonName: String?

  // MARK: - Lifecycle methods
  override func viewDidLoad() {
    super.viewDidLoad()

    self.title = pokemonName
    self.nameLabel.text = pokemonName
  }

}
