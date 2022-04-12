//
//  PokemonsController.swift
//  Pokedex
//
//  Created by Oscar Cabanillas on 12/04/2022.
//

import UIKit

// MARK: - DetailViewController class

final class PokemonsController: UIViewController {

  // Outlets
  @IBOutlet private weak var tableView: UITableView!

  // Variables
  private var selectedPokemon: Pokemon?
  private var pokemons: [Pokemon]?

  // MARK: - Lifeccyle methods

  override func viewDidLoad() {
    super.viewDidLoad()

    self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "pokemon_cell")
    self.pokemons = getPokemons()
  }

  func getPokemons() -> [Pokemon] {
    return [Pokemon(name: "Pikachu"), Pokemon(name: "Mew"), Pokemon(name: "MewTwo"), Pokemon(name: "Eevee"), Pokemon(name: "Lucario"), Pokemon(name: "Dugtrio"), Pokemon(name: "Magikarp")]
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "Detail", let detailController: PokemonController = segue.destination as? PokemonController {
      detailController.pokemonName = self.selectedPokemon?.name
    }
  }
}

// MARK: - PlaceHolderUITableViewDataSource methods
extension PokemonsController: UITableViewDataSource {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return pokemons?.count ?? 0
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "pokemon_cell", for: indexPath)
    let pokemon: Pokemon? = self.pokemons?[indexPath.row]
    cell.textLabel?.text = pokemon?.name
    cell.accessoryType = .disclosureIndicator
    return cell
  }
}

// MARK: - UITableViewDelegate methods
extension PokemonsController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)

    self.selectedPokemon = self.pokemons?[indexPath.row]
    self.performSegue(withIdentifier: "Detail", sender: nil)
  }
}

