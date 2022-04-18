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

    setupNavigationBar()
    self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "pokemon_cell")
    let provider: PokemonProvider = PokemonProvider()
    provider.getPokemons { pokemons in
      DispatchQueue.main.async { [weak self] in
        guard let strongSelf = self else {

          return
        }
        strongSelf.pokemons = pokemons
        strongSelf.tableView.reloadData()
      }

    }

  }


  //  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
  //    if segue.identifier == "Detail", let detailController: PokemonController = segue.destination as? PokemonController {
  //      detailController.pokemonName = self.selectedPokemon?.name
  //    }
  //  }

  private func setupNavigationBar() {

    navigationController?.navigationBar.barTintColor = .red
    navigationController?.navigationBar.tintColor = .white
    let pokemonLogo = UIImage(named: "pokemonLogo")
    let pokemonNavigationBarImg = UIImageView(image: pokemonLogo)
    pokemonNavigationBarImg.contentMode = .scaleAspectFit
    navigationItem.titleView = pokemonNavigationBarImg
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

    //    self.selectedPokemon = self.pokemons?[indexPath.row]
    //    self.performSegue(withIdentifier: "Detail", sender: nil)

    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    guard let detailController: PokemonController = storyBoard.instantiateViewController(identifier: "PokemonController") as? PokemonController else {
      preconditionFailure("There was an issue getting PokemonController from Main storyboard")
    }

//    detailController.pokemonName = self.pokemons?[indexPath.row].name
    let selectedPoke: Pokemon?  = self.pokemons?[indexPath.row]
    detailController.pokeComplete = selectedPoke
    self.navigationController?.pushViewController(detailController, animated: true)
  }
}

