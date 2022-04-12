//
//  PokemonsController.swift
//  Pokedex
//
//  Created by Oscar Cabanillas on 12/04/2022.
//

import UIKit

struct Pokemon {
  let name: String?
}

// MARK: - DetailViewController class

final class PokemonsController: UIViewController {

  // Outlets
  @IBOutlet private weak var tableView: UITableView!

  // Variables
  private var selectedName: String?
  private var pokemons: [Pokemon]?

  // MARK: - Lifeccyle methods

  override func viewDidLoad() {
    super.viewDidLoad()

    self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "pokemon_cell")
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "Detail", let detailController: PokemonController = segue.destination as? PokemonController {
      detailController.pokemonName = self.selectedName
    }
  }
}

// MARK: - PlaceHolderUITableViewDataSource methods
extension PokemonsController: UITableViewDataSource {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "pokemon_cell", for: indexPath)
    cell.textLabel?.text = "pokemon \(indexPath.row + 1)"
    cell.accessoryType = .disclosureIndicator
    return cell
  }
}

// MARK: - UITableViewDelegate methods
extension PokemonsController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)

    self.selectedName = "pokemon \(indexPath.row + 1)"
    self.performSegue(withIdentifier: "Detail", sender: nil)
  }
}

