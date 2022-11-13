//
//  ContentView.swift
//  Recipe List App
//
//  Created by WilliamD on 2022/11/13.
//

import SwiftUI

struct RecipeListView: View {
    @ObservedObject var model = RecipeModel()
    
    var body: some View {
        NavigationView {
            List(model.recipes) { r in
                NavigationLink(
                    destination: RecipeDetailView(recipe: r),
                    label: {
                        HStack {
                            Image(r.image)
                                .resizable()
                                . scaledToFill()
                                .frame(minWidth: 50, idealWidth: 50, maxWidth: 50, minHeight: 50, idealHeight: 50, maxHeight: 50, alignment: .center)
                                .clipped()
                                .cornerRadius(5)
                            Text(r.name)
                        }
                })
                
            }
            .navigationTitle("All Recipes")
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
