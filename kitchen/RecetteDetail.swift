//
//  ContentView.swift
//  kitchen
//
//  Created by Aurelien Pietrzak on 05/11/2019.
//

import SwiftUI
import MapKit

struct RecetteDetail: View {
    
    var recette: Recette
    
    var body: some View {
        VStack {
            MapView(coordinate : CLLocationCoordinate2D(
            latitude: 34.011286, longitude: -116.166868))
                .frame(height: 300)
                .edgesIgnoringSafeArea(.top)
            
            CircleImage(image : recette.image)
            .offset(y: -130)
            .padding(.bottom, -130)

            VStack(alignment: .leading) {
                Text(recette.name)
                    .font(.title)
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
    }
}
