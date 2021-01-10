//
//  TableViewController.swift
//  StarWarsAPI
//
//  Created by Jorge Giannotta on 07/01/2021.
//  Copyright © 2021 Westcostyle. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var characters:[SWCharacterList] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let pages = [1,2]
        let random = pages.randomElement()!
        SWCharacter.getCharacter(self, random)
        
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.systemYellow]
        tableView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        tableView.separatorStyle = .none
        tableView.rowHeight = 65.0
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return characters.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath)

        let char = characters[indexPath.row]
        cell.textLabel?.text = char.name
        if char.getImage() == nil {
            cell.imageView?.image = UIImage(named: "placeholder")
        }else {
            cell.imageView?.image = char.getImage()
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        let char = characters[indexPath.row]
        char.getMovies()
        char.getVehicles()
        performSegue(withIdentifier: "toDetailsView", sender: char)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toDetailsView" {
            let vc = segue.destination as! DetailViewController
            let charact = sender as! SWCharacterList
            vc.characterDetail = charact

        }
    }

}
