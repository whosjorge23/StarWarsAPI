//
//  StarWarsCharacters.swift
//  StarWarsAPI
//
//  Created by Jorge Giannotta on 08/01/2021.
//  Copyright © 2021 Westcostyle. All rights reserved.
//

import Foundation
import UIKit

struct SWCharacterList: Decodable {
    var name : String
    var url : String
    var height : String
    var mass: String
    var hair_color: String
    var skin_color: String
    var eye_color: String
    var birth_year: String
    var gender: String
    var films: [String]
    var vehicles: [String]
    
    func getImage() -> UIImage? {
        let apiUrl = "http://mobile.aws.skylabs.it/mobileassignments/swapi/"
        let urlPieces = url.split(separator: "/")
        let charID = urlPieces[urlPieces.count-1]
        guard let imgUrl = URL(string: apiUrl + "\(charID).png") else {
            
            return nil
        }
        print(imgUrl)
        
        guard let imgData = try? Data(contentsOf: imgUrl) else {
            return nil
        }
        print(imgData)
        
        guard let charImage = UIImage(data: imgData) else {
            return nil
        }
        print(charImage)
        return charImage
    }
    
    func getMovies() -> [String] {
        for movie in films {
            guard let url = URL(string: movie) else {return []}
            URLSession.shared.dataTask(with: url) { (data, response, err) in
                
                guard let data = data else {return}
                
                let dataAsString = String(data: data, encoding: .utf8)
//                print(dataAsString)
                
                do {
                    let film = try JSONDecoder().decode(FilmsList.self, from: data)
                    print("Films")
                    print(film.title)
                    print(film.release_date)
                    print(film.opening_crawl)
                }catch let jsonErr {
                    print("Error Serializing Json: ",jsonErr)
                }
                
                
            }.resume()
        }
        return []
    }
    
    func getVehicles() -> [String] {
            
        for vehicle in vehicles {
            guard let url = URL(string: vehicle) else {return []}
            URLSession.shared.dataTask(with: url) { (data, response, err) in
                
            guard let data = data else {return}
                
            let dataAsString = String(data: data, encoding: .utf8)
                
            do {
                let vehic = try JSONDecoder().decode(VehiclesList.self, from: data)
                print("Vehicles")
                print(vehic.name)
                print(vehic.model)
                print(vehic.manufacturer)
                print(vehic.cost_in_credits)
                print(vehic.length)
                print(vehic.max_atmosphering_speed)
                print(vehic.crew)
                print(vehic.passengers)
                print(vehic.cargo_capacity)
                print(vehic.consumables)
                print(vehic.vehicle_class)
            }catch let jsonErr {
                print("Error Serializing Json: ",jsonErr)
            }
                
            }.resume()
        }
        return []
    }
    
}

struct SWResponse: Decodable {
    var count: Int
    var next: String?
    var previous: String?
    var results: [SWCharacterList]
}

struct SWCharacter {
    static let swapi = "https://swapi.dev/api/people/"
    static let charactersCount = 82
    
    static func getCharacter(_ charCtrl: TableViewController, _ page : Int) -> [SWCharacterList] {
        
        let decoder = JSONDecoder()
        let url = URL(string: swapi+"?limit=\(charactersCount)&page=\(page)")
        let urlSession = URLSession.shared
        let task = urlSession.dataTask(with:url!) {
            (data,response,error) in
                if error != nil {
                    print(error!)
                }
            
            guard let httpResponse = response as? HTTPURLResponse else {
//                print(response!)
                return
            }
            
            if httpResponse.statusCode != 200 {
                print(httpResponse)
                return
            }
            
            guard let data = data else {
                
                return
            }
            
            //Parse data in JSON
            
            let jsonData = try? decoder.decode(SWResponse.self, from: data)
//            print(jsonData)
            
            if jsonData != nil {
                DispatchQueue.main.async {
                    charCtrl.characters = (jsonData?.results)!
                    charCtrl.tableView.reloadData()
                }
            }
            
        }
        task.resume()
        
        return[]
    }
    
    static func getCharacterCollection(_ charCtrlCollection: CollectionViewController,_ page : Int) -> [SWCharacterList] {
        
        let decoder = JSONDecoder()
        let url = URL(string: swapi+"?limit=\(charactersCount)&page=\(page)")
        let urlSession = URLSession.shared
        let task = urlSession.dataTask(with:url!) {
            (data,response,error) in
                if error != nil {
                    print(error!)
                }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print(response!)
                return
            }
            
            if httpResponse.statusCode != 200 {
                print(httpResponse)
                return
            }
            
            guard let data = data else {
                
                return
            }
            
            //Parse data in JSON
            
            let jsonData = try? decoder.decode(SWResponse.self, from: data)
//            print(jsonData)
            
            if jsonData != nil {
                DispatchQueue.main.async {
                    charCtrlCollection.characters = (jsonData?.results)!
                    charCtrlCollection.collectionView.reloadData()
                }
            }
            
            
        }
        task.resume()
        
        return[]
    }
}

struct FilmsList:Decodable {
    var title: String
    var release_date: String
    var opening_crawl: String
    
}

struct VehiclesList:Decodable {
    var name: String
    var model: String
    var manufacturer: String
    var cost_in_credits: String
    var length: String
    var max_atmosphering_speed: String
    var crew: String
    var passengers: String
    var cargo_capacity: String
    var consumables: String
    var vehicle_class: String
    
}
