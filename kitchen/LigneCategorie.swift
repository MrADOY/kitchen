//
//  LigneCategorie.swift
//  kitchen
//
//  Created by Aurelien Pietrzak on 07/11/2019.
//

import SwiftUI
import KingfisherSwiftUI

struct LigneCategorie: View {
    var nomCategorie: String
    var items: [RecetteJson]
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
                        }.buttonStyle(PlainButtonStyle())
                    }
                }.padding(15)
            }
        }
    }
}


struct CategoryItem: View {
    var recette: RecetteJson
    var body: some View {
        
                VStack(alignment: .leading){
               
                    Text(recette.name)
                        .lineLimit(nil)
                        .multilineTextAlignment(.leading)
                        .padding(.leading, 20)


                    HStack(spacing: 4) {
                       Image(systemName: "clock")
                           .imageScale(.small)
                       Text("\(String(recette.duration ?? 0)) min")
                           .font(.caption)
                           .fontWeight(.light)
                    }.padding(.leading, 20)



                    HStack(spacing: 2){
                       Text("Avis: ")
                           .font(.caption)
                           .fontWeight(.light)
                       HStack(spacing: -1.0) {
                           ForEach(0 ..< (recette.avis ?? 0)) { _ in
                                   Image(systemName: "star.fill")
                                       .imageScale(.small)
                                       .foregroundColor(.yellow)
                               }
                       }
                    }.padding(.leading, 20)


                    

        }
        .frame(width: 500, height: 190, alignment: .leading)
        .background(MenuImage(url: recette.picture_url)
        .edgesIgnoringSafeArea(.all).scaledToFill())
                .cornerRadius(10.0)
    
    }
}

