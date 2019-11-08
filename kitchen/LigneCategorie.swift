//
//  LigneCategorie.swift
//  kitchen
//
//  Created by Aurelien Pietrzak on 07/11/2019.
//

import SwiftUI

struct LigneCategorie: View {
    var nomCategorie: String
    var items: [Recette]    
    var body: some View {
        VStack(alignment: .leading) {
            Text(self.nomCategorie)
                .font(.headline)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top) {
                    ForEach(self.items) { recette in
                        NavigationLink(
                            destination: RecetteDetail(
                                recette: recette
                            )
                        ) {
                            CategoryItem(recette: recette)
                        }
                    }
                }
            }
        }
    }
}


struct CategoryItem: View {
    var recette: Recette
    var body: some View {
        VStack(alignment: .center) {
            HStack(alignment: .center){
                recette.image
                .resizable()
                .frame(width: 155, height: 155)
                
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10)
                    .padding(.top, 10)
                
                Text(recette.name)

   
            }
            .padding(.top)
            
            HStack(alignment: .top){
                Image(systemName: "clock")
                    .imageScale(.small)
                Text("20 min")
                    .font(.caption)
                    .fontWeight(.light)
                Text("Notes")
                    .font(.caption)
                    .fontWeight(.light)
                HStack(spacing: -1.0) {
                        ForEach(0 ..< recette.avis) { _ in
                            Image(systemName: "star.fill")
                                .imageScale(.small)
                                .foregroundColor(.yellow)
                        }
                    }
            }
            .padding(.bottom)
        }
        .frame(width: 500, height: 190)

    }
}

struct LigneCategorie_Previews: PreviewProvider {
    static var previews: some View {
      
        LigneCategorie(
            nomCategorie: recetteData[0].categorie.rawValue,
            items: Array(recetteData.prefix(3))
        )
    }
}
