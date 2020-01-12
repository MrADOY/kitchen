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
        
        VStack(){
           

    
            HStack(alignment: .top){
                CircleImage(image : recette.image)
                    .offset(y: -130)
                
                Text(recette.name)
                    .font(.headline)
                    
            
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
            HStack{
            PieChartView(data : [
                DataCharts(num :56, categorie: "Lipides", color: Color.red),
                DataCharts(num :34, categorie: "Protéines", color: Color.blue),
                DataCharts(num :128, categorie: "Glucides", color: Color.green)
            ], title: "Macronutriment", legend: "Legend")
                VStack{
                RecettesInstructions()
                    NavigationLink(destination: AVPlayerView(videoURL : URL(string: "https://www.radiantmediaplayer.com/media/bbb-360p.mp4")!)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)) {
                          Text("Video")
                          }
                }
            }
    }
        
        
    }
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

struct RecetteDetail_Preview: PreviewProvider {
    static var previews: some View {
        RecetteDetail(recette : recetteData[0])
            .environmentObject(UserData())
    }
}
