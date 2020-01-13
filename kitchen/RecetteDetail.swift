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
    var recette: RecetteJson
    
    var body: some View {
        
        VStack(){
            HStack(alignment: .top){
                
                Text(recette.name)
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .offset(x: 0, y: -40)
                
                HStack(spacing: 3) {
                    ForEach(0 ..< (recette.avis!)) { _ in
                        Image(systemName: "star.fill")
                            .padding(.leading)
                            .imageScale(.medium)
                            .foregroundColor(.yellow)
                    }
                }
                
                Spacer()
                
                HStack(alignment: .center){
                    
                    Text("Durée : 45min")
                    Text("Difficulté : ***")
                    Text("Coût : €€€")
                }
            }
            
            HStack(alignment: .top){
                VStack(alignment: .leading){
                           ForEach(0 ..< recette.ingredients.count){ Ingredient in
                            Text(recette.ingredients[Ingredient].name)
                           }
                }
                
                Divider()
                
                VStack(alignment: .trailing){
                    RecettesInstructions()
                }
            }
            
            HStack(alignment: .bottom, spacing: 50){
                
                Button(action: {
                self.userData.recettes[self.recette.id].isFavorite.toggle()
                    })
                {
                    if self.userData.recettes[self.recette.id].isFavorite {
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.yellow)
                    } else {
                        Image(systemName: "star")
                            .foregroundColor(Color.gray)
                    }
                }
                
                Button(action: {
                self.userData.recettes[self.recette.id].isFavorite.toggle()
                    })
                {
                    if self.userData.recettes[self.recette.id].isFavorite {
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.yellow)
                    } else {
                        Image(systemName: "star")
                            .foregroundColor(Color.gray)
                    }
                }
                
                Button(action: {
                self.userData.recettes[self.recette.id].isFavorite.toggle()
                    })
                {
                    if self.userData.recettes[self.recette.id].isFavorite {
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.yellow)
                    } else {
                        Image(systemName: "star")
                            .foregroundColor(Color.gray)
                    }
                }
                
                Button(action: {
                self.userData.recettes[self.recette.id].isFavorite.toggle()
                    })
                {
                    if self.userData.recettes[self.recette.id].isFavorite {
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.yellow)
                    } else {
                        Image(systemName: "star")
                            .foregroundColor(Color.gray)
                    }
                }
                
                Spacer()
                
                    NavigationLink(destination: AVPlayerView(videoURL : URL(string: "https://www.radiantmediaplayer.com/media/bbb-360p.mp4")!)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .edgesIgnoringSafeArea(.all)) {
                            Text("Voir la recette en vidéo")
                    }
            }
            
                        
//
//                HStack(){
//                Button(action: {
//                    self.userData.recettes[self.recette.id].isFavorite.toggle()
//                }) {
//                    if self.userData.recettes[self.recette.id].isFavorite {
//                        Image(systemName: "star.fill")
//                            .foregroundColor(Color.yellow)
//                    } else {
//                        Image(systemName: "star")
//                            .foregroundColor(Color.gray)
//                    }
//
//                }
//
//                NavigationLink(destination: AVPlayerView(videoURL : URL(string: "https://www.radiantmediaplayer.com/media/bbb-360p.mp4")!)
//                       .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
//                       .edgesIgnoringSafeArea(.all)) {
//                             Text("Video")
//                             }
//            }
//
//            HStack{
//            PieChartView(data : [
//                DataCharts(num :56, categorie: "Lipides", color: Color.red),
//                DataCharts(num :34, categorie: "Protéines", color: Color.blue),
//                DataCharts(num :128, categorie: "Glucides", color: Color.green)
//            ], title: "Macronutriment", legend: "Legend")
//
//                RecettesInstructions()
//
//
//            }
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(URLImage(url: recette.picture_url)
        .edgesIgnoringSafeArea(.all))   //NE PAS TOUCHER CES 3 LIGNES
    }


struct RecettesInstructions: View {
    
    var body: some View {
        VStack(spacing: 1.0){
        Text("Etape 1 : Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
        Text("Etape 2 : Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
        Text("Etape 3 : Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
        Text("Etape 4 : Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
        }
    }
}
    
//struct RecettesIngredients: View {
//    @EnvironmentObject var userData: UserData
//    var body: some View {
//
//}
//    }

}
