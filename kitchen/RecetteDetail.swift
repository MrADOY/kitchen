//
//  ContentView.swift
//  kitchen
//
//  Created by Aurelien Pietrzak on 05/11/2019.
//

import SwiftUI
import MapKit

struct RecetteDetail: View {
    
    @EnvironmentObject var userData: UserData
    var recette: Recette
    
    
    var recetteIndex: Int {
        userData.recettes.firstIndex(where: { $0.id == recette.id })!
    }
    
    var body: some View {
        VStack {
            
            CircleImage(image : recette.image)
            .offset(y: -130)
            .padding(.bottom, -130)

            VStack(alignment: .leading) {
                HStack {
                    Text(recette.name)
                        .font(.title)
                    Button(action: {
                        self.userData.recettes[self.recetteIndex].isFavorite.toggle()
                    }) {
                        if self.userData.recettes[self.recetteIndex].isFavorite {
                            Image(systemName: "star.fill")
                                .foregroundColor(Color.yellow)
                        } else {
                            Image(systemName: "star")
                                .foregroundColor(Color.gray)
                        }
                    }
                }
                HStack(alignment: .top) {
                    Text("Joshua Tree National Park")
                        .font(.subheadline)
                    Text("California")
                        .font(.subheadline)
                }
            }
            .padding()
            Spacer()
        }
    }
}

struct RecetteDetail_Preview: PreviewProvider {
    static var previews: some View {
        RecetteDetail(recette : recetteData[0])
         .environmentObject(UserData())
    }
}
