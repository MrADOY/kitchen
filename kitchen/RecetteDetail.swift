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
    
    var recetteIndex: Int {
        self.userData.recetteDataJson.firstIndex(where: { $0.id == recette.id })!
    }
    
    var body: some View {
        
        VStack(){
            HStack(alignment: .top){
                
                Text(recette.name)
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .offset(x: 0, y: -40)
                
                HStack(spacing: 3) {
                    ForEach(0 ..< (recette.avis ?? 0)) { _ in
                        Image(systemName: "star.fill")
                            .padding(.leading)
                            .imageScale(.medium)
                            .foregroundColor(.yellow)
                    }
                }
                
                Spacer()

                HStack(alignment: .center){

                    Text("Durée : \(String(recette.duration ?? 0)) min")
                    HStack(spacing : -1){
                        Text("Difficulté : ")
                        ForEach(0 ..< (recette.difficulty ?? 0)) { num in
                            Text("*")
                        }
                    }
                    HStack(spacing : -1){
                        Text("Coût : ")
                        ForEach(0 ..< (recette.budget ?? 0)) { _ in
                            Text("€")
                        }
                    }
               }.background(Color.white.opacity(0.5).cornerRadius(20.0).padding(-10))

            }
            
            HStack(alignment: .top){
                VStack(alignment: .leading, spacing: 20){    //Ingredients
                    Text("\(String(recette.portions ?? 0)) personnes").bold()
                    Divider().frame(width: 250)
                    ForEach(self.recette.ingredients){ ingredient in
                        Text("\(ingredient.name ?? "")")
                            + Text(" : \(String(ingredient.quantity ?? 0)) ")
                                + Text("\(ingredient.unit ?? "")")
                    }
                }.background(Color.white.opacity(0.5).cornerRadius(20.0).padding(-30))
                
                Divider()

                VStack(alignment: .leading, spacing: 30){    //Instructions
                    ForEach(self.recette.steps){ step in
                        Text(" \(String(step.order ?? 0))- ")
                               + Text("\(step.action ?? "")")
                   }
                }.background(Color.white.opacity(0.5).cornerRadius(20.0).padding(-30))
                
                Spacer()
            }

            HStack(alignment: .bottom, spacing: 50){
                
                Button(action: {
                    WebService().postFavorite(idRecette: self.recette.id){_ in
                        self.userData.recetteDataJson[self.recetteIndex].favorite.toggle()
                    }
                    })
                {
                    if self.userData.recetteDataJson[self.recetteIndex].favorite {
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.yellow)
                    } else {
                        Image(systemName: "star")
                            .foregroundColor(Color.gray)
                    }
                }
                Spacer()
                
                if recette.video != nil{
                    NavigationLink(destination: AVPlayerView(videoURL : URL(string: recette.video ?? "")!)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .edgesIgnoringSafeArea(.all)) {
                            Text("Voir la recette en vidéo")
                    }
                } else {
                    EmptyView()
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
}
