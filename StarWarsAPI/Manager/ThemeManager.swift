//
//  ThemeManager.swift
//  StarWarsAPI
//
//  Created by Jorge Giannotta on 10/01/2021.
//  Copyright © 2021 Westcostyle. All rights reserved.
//

import UIKit

class ThemeManager {

    static func setup() {
        
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithDefaultBackground()
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
            
            let coloredAppearance = UINavigationBarAppearance()
            coloredAppearance.configureWithOpaqueBackground()
            coloredAppearance.backgroundColor = UIColor.clear
            coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.systemYellow]
            coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.systemYellow]
                   
            UINavigationBar.appearance().standardAppearance = coloredAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
        } else {
            UINavigationBar.appearance().barTintColor = UIColor.clear
            UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemYellow]
            UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemYellow]
        }
    }
}
