//
//  ListeRecette.swift
//  kitchen
//
//  Created by Aurelien Pietrzak on 05/11/2019.
//

import SwiftUI

struct ListeRecette: View {
    
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $userData.showFavoritesOnly) {
                    Text("Favorites only")
                }

                ForEach(userData.recettes) { recette in
                    if !self.userData.showFavoritesOnly || recette.isFavorite {
                        NavigationLink(destination: RecetteDetail(recette : recette)) {
                            LigneRecette(recette: recette)
                        }
                    }
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
