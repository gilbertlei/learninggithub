//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by WilliamD on 2022/11/13.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe: Recipe
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading) {
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding([.bottom, .top], 5)
                    ForEach(recipe.ingredients, id: \.self) {item in
                        Text("- " + item)
                    }
                }
                .padding(.horizontal)
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Directions")
                        .font(.headline)
                        .padding(.bottom, 5)
                    ForEach(0...recipe.directions.count-1, id: \.self) { index in
                        Text(String(index + 1) + ". " + recipe.directions[index])
                            .padding(.bottom, 5)
                    }
                }
                .padding(.horizontal)
            }
        }
        .navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let model = RecipeModel()
        RecipeDetailView(recipe: model.recipes[0])
    }
}
