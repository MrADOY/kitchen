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
            .overlay(
                Rectangle().stroke(Color.white, lineWidth: 5))
            .shadow(radius: 10)
            
            VStack {
                HStack{
                    Text(recette.name)
                    if recette.isFavorite {
                        Image(systemName: "star.fill")
                            .imageScale(.medium)
                            .foregroundColor(.yellow)
                    }
                }
                HStack{
                    Text("Durée 20 min")
                        .font(.caption)
                        .fontWeight(.light)
                    Text("Notes")
                        .font(.caption)
                        .fontWeight(.light)
                    HStack(spacing: -1.0) {
                            ForEach(0 ..< recette.avis) { _ in
                                Image(systemName: "star.fill")
                                    .padding(.leading)
                                    .imageScale(.small)
                                    .foregroundColor(.yellow)
                            }
                        }
                    }
                }
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
