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

    enum Category: String, CaseIterable, Codable, Hashable {
        case featured = "Featured"
        case lakes = "Lakes"
        case rivers = "Rivers"
    }
}

extension Recette {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}
