//
//  CollectionViewController.swift
//  StarWarsAPI
//
//  Created by Jorge Giannotta on 07/01/2021.
//  Copyright © 2021 Westcostyle. All rights reserved.
//

import UIKit

private let reuseIdentifier = "CollectionCell"

class CollectionViewController: UICollectionViewController {
    
    var characters:[SWCharacterList] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        let pages = [1,2]
        let random = pages.randomElement()!
        SWCharacter.getCharacterCollection(self, random)
        
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.systemYellow]

        // Register cell classes
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return characters.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CustomViewCell
    
        let char = characters[indexPath.row]
        cell.avatarName.text = char.name
        
        if char.getImage() == nil {
            cell.avatarImage.image = UIImage(named: "placeholder")
        }else {
            cell.avatarImage.image = char.getImage()
        }
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let char = characters[indexPath.row]
        char.getMovies()
        char.getVehicles()
        performSegue(withIdentifier: "toDetail", sender: char)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toDetail" {
            let vc = segue.destination as! DetailViewController
            let charact = sender as! SWCharacterList
            vc.characterDetail = charact

        }
    }

}
