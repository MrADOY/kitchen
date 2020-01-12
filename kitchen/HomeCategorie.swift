//
//  CategoryHome.swift
//  kitchen
//
//  Created by Aurelien Pietrzak on 07/11/2019.
//

import SwiftUI

struct HomeCategorie: View {
        
    @EnvironmentObject var userData: UserData
    
    var categories: [String: [Recette]] {
        Dictionary(
            grouping: recetteData,
            by: { $0.categorie.rawValue }
        )
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(categories.keys.sorted(), id: \.self) { key in
                    LigneCategorie(nomCategorie: key, items: self.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
                
                LigneCategorie(nomCategorie: "Favori", items: self.userData.recettes.filter { $0.isFavorite})
                    .listRowInsets(EdgeInsets())
            }
        }
    }
}

struct HomeCategorie_Previews: PreviewProvider {
    static var previews: some View {
        HomeCategorie()
    }
}


