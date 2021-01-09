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

        // Do any additional setup after loading the view.
        if characterDetail?.getImage() == nil {
            avatarImage.image = UIImage(named: "placeholder")
        }else {
            avatarImage.image = characterDetail?.getImage()
        }
        nameLabel.text = "Name: \(characterDetail?.name ?? "")"
        heightLabel.text = "Height: \(characterDetail?.height ?? "")"
        massLabel.text = "Mass: \(characterDetail?.mass ?? "")"
        hairColorLabel.text = "Hair Color: \(characterDetail?.hair_color ?? "")"
        skinColorLabel.text = "Skin Color: \(characterDetail?.skin_color ?? "")"
        eyesColorLabel.text = "Eyes Color: \(characterDetail?.eye_color ?? "")"
        genderLabel.text = "Gender: \(characterDetail?.gender ?? "")"
        birthYearLabel.text = "Birth Year: \(characterDetail?.birth_year ?? "")"
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
