//
//  ViewController.swift
//  StarWarsAPI
//
//  Created by Jorge Giannotta on 07/01/2021.
//  Copyright © 2021 Westcostyle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        for family: String in UIFont.familyNames
//               {
//                   print(family)
//                   for names: String in UIFont.fontNames(forFamilyName: family)
//                   {
//                       print("== \(names)")
//                   }
//               }
        
        // Do any additional setup after loading the view.
        titleLabel.font = UIFont(name: "StarJediOutline", size: 40)
    }


}

