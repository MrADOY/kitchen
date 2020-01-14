//
//  LigneRecette.swift
//  kitchen
//
//  Created by Aurelien Pietrzak on 05/11/2019.
//

import SwiftUI
import KingfisherSwiftUI

struct LigneRecette: View {
    var recette: RecetteJson
    var body: some View {
        HStack {
            KFImage(URL(string: recette.picture_url)!) .resizable()
            .frame(width: 200, height: 150 )
            .overlay(
                Rectangle().stroke(Color.white, lineWidth: 5))
            .shadow(radius: 10)
            
            VStack {
                HStack{
                    Text(recette.name)
                    if recette.favorite {
                        Image(systemName: "star.fill")
                            .imageScale(.medium)
                            .foregroundColor(.yellow)
                    }
                }
                HStack{
                    Text("number: \(String(recette.duration ?? 0))")
                        .font(.caption)
                        .fontWeight(.light)
                    Text("Notes")
                        .font(.caption)
                        .fontWeight(.light)
                    HStack(spacing: -1.0) {
                        ForEach(0 ..< (recette.avis ?? 0)) { _ in
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
