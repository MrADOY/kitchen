//
//  LigneRecette.swift
//  kitchen
//
//  Created by Aurelien Pietrzak on 05/11/2019.
//

import SwiftUI

struct LigneRecette: View {
    var recette: Recette
    var body: some View {
        HStack {
            recette.image
            .resizable()
            .frame(width: 200, height: 150 )
            
            Text(recette.name)
        }
    }
}

struct LigneRecette_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
        LigneRecette(recette : recetteData[0])
        LigneRecette(recette : recetteData[1])
        }

    }
}
