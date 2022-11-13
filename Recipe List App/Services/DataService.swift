//
//  DataService.swift
//  Recipe List App
//
//  Created by WilliamD on 2022/11/13.
//

import Foundation

class DataService {
    func getLocalData() -> [Recipe] {
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        guard pathString != nil else {
            return [Recipe]()
        }
        
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            let data = try Data(contentsOf: url)
            let decorder = JSONDecoder()
            do {
                let recipeData = try decorder.decode([Recipe].self, from: data)
                for r in recipeData {
                    r.id = UUID()
                }
                return recipeData
            }
            catch {
                print(error)
            }
        }
        catch {
            print(error)
        }
        
        return [Recipe]()
    }
}
