//
//  Recette.swift
//  kitchen
//
//  Created by Aurelien Pietrzak on 05/11/2019.
//


import SwiftUI
import CoreLocation

struct Recette: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var imageName: String
    var isFavorite: Bool
    var avis: Int
    var categorie : Category
    var enVedette : Bool
    
    enum Category: String, CaseIterable, Codable, Hashable {
        case tendance = "Tendance"
        case populaire = "Populaire"
    }
}

extension Recette {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}
