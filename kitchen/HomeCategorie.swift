//
//  CategoryHome.swift
//  kitchen
//
//  Created by Aurelien Pietrzak on 07/11/2019.
//

import SwiftUI

struct HomeCategorie: View {
        
    @EnvironmentObject var userData: UserData
    @ObservedObject var recetteDataJson = RecettesListModel()
    
    var categories: [String: [RecetteJson]] {
        Dictionary(
            grouping: self.recetteDataJson.recettes,
            by: { $0.categories.rawValue }
        )
    }
    
    var body: some View {
        VStack{
        NavigationView {
            List {
                ForEach(categories.keys.sorted(), id: \.self) { key in
                    LigneCategorie(nomCategorie: key, items: self.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
                
                
                LigneCategorie(nomCategorie: "Favori", items: self.userData.recetteDataJson.filter{ ($0.favorite ?? false)})
                    .listRowInsets(EdgeInsets())
            }
            }
        }
    }
}

struct HomeCategorie_Previews: PreviewProvider {
    static var previews: some View {
        HomeCategorie()
    }
}


