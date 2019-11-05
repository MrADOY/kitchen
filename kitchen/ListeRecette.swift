//
//  ListeRecette.swift
//  kitchen
//
//  Created by Aurelien Pietrzak on 05/11/2019.
//

import SwiftUI

struct ListeRecette: View {
    var body: some View {
        NavigationView {
            List(recetteData) { recette in
                NavigationLink(destination: RecetteDetail(recette : recette)) {
                    LigneRecette(recette: recette)
                }
            }
            .navigationBarTitle(Text("Recettes"))
        }
    }
}

struct ListeRecette_Previews: PreviewProvider {
    static var previews: some View {
        ListeRecette()
    }
}
