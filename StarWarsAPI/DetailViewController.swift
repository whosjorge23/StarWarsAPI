//
//  DetailViewController.swift
//  StarWarsAPI
//
//  Created by Jorge Giannotta on 07/01/2021.
//  Copyright © 2021 Westcostyle. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var characterDetail : SWCharacterList?
    
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    @IBOutlet weak var hairColorLabel: UILabel!
    @IBOutlet weak var skinColorLabel: UILabel!
    @IBOutlet weak var eyesColorLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var birthYearLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.systemYellow]
        
        if characterDetail?.getImage() == nil {
            avatarImage.image = UIImage(named: "placeholder")
        }else {
            avatarImage.image = characterDetail?.getImage()
        }
        nameLabel.text = "Name: \(characterDetail?.name ?? "")".capitalized
        heightLabel.text = "Height: \(characterDetail?.height ?? "")".capitalized
        massLabel.text = "Mass: \(characterDetail?.mass ?? "")".capitalized
        hairColorLabel.text = "Hair Color: \(characterDetail?.hair_color ?? "")".capitalized
        skinColorLabel.text = "Skin Color: \(characterDetail?.skin_color ?? "")".capitalized
        eyesColorLabel.text = "Eyes Color: \(characterDetail?.eye_color ?? "")".capitalized
        genderLabel.text = "Gender: \(characterDetail?.gender ?? "")".capitalized
        birthYearLabel.text = "Birth Year: \(characterDetail?.birth_year ?? "")"
    }

}
