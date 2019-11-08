//
//  CategoryHome.swift
//  kitchen
//
//  Created by Aurelien Pietrzak on 07/11/2019.
//

import SwiftUI

struct HomeCategorie: View {
    
    var categories: [String: [Recette]] {
        Dictionary(
            grouping: recetteData,
            by: { $0.categorie.rawValue }
        )
    }
    
    var enVedettes: [Recette] {
        recetteData.filter { $0.enVedette }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(categories.keys.sorted(), id: \.self) { key in
                    LigneCategorie(nomCategorie: key, items: self.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
                
                LigneCategorie(nomCategorie: "Favori", items: recetteData)
                    .listRowInsets(EdgeInsets())
            }
        }
    }
}

struct TestRow: View {


    @State private var backgroundColor = Color.clear

    var body: some View {
        Text("tOTO")
        .focusable(true) { isFocused in
            self.backgroundColor = isFocused ? Color.green : Color.blue
            if isFocused {
                print("TOTO")
            }
        }
        .background(self.backgroundColor)
    }
}

struct RecetteEnVedette: View {
    var recettes: [Recette]
    var body: some View {
        recettes[0].image.resizable()
    }
}

struct HomeCategorie_Previews: PreviewProvider {
    static var previews: some View {
        HomeCategorie()
    }
}


