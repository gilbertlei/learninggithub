//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by WilliamD on 2022/11/13.
//

import Foundation

class RecipeModel: ObservableObject {
    @Published var recipes = [Recipe]()
    
    init() {
        let service = DataService()
        self.recipes = service.getLocalData()
    }
}
