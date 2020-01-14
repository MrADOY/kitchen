//
//  RecetteJson.swift
//  kitchen
//
//  Created by Aurelien Pietrzak on 12/01/2020.
//

import SwiftUI
import CoreLocation
import KingfisherSwiftUI

struct RecetteJson: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var duration: Int?
    var budget: Int?
    var difficulty: Int?
    var portions: Int?
    var video: String?
    var picture_url: String
    var favorite : Bool
    var avis : Int?
    var time : Time
    var time_full: [TimeFull]
    var ingredients : [Ingredient]
    var categories : Category
    var nutritions : Nutrition
    var nutritions_full : [NutritionFull]
    var steps : [Etape]
}

enum Category: String, CaseIterable, Codable, Hashable {
    case tendances = "Tendances"
    case populaires = "Populaires"
    case entress = "Entrées"
    case plats = "Plats"
    case desserts = "Desserts"
}

struct Time: Hashable, Codable {
    var Preparation: String?
    var Total: String?
}

struct TimeFull: Hashable, Codable {
    var id : Int?
    var name : String?
    var duration: String?
    var recette_id: Int?
}

struct Ingredient: Hashable, Codable, Identifiable{
    var id : Int?
    var name : String?
    var quantity: Int?
    var unit: String?
    var recette_id : Int?
}

struct Categorie: Hashable, Codable {
    var id : Int?
    var name : String?
}

struct Nutrition: Hashable, Codable {
    var Calories : String?
}

struct NutritionFull: Hashable, Codable {
    var id : Int?
    var name : String?
    var value : Float?
    var unit : String?
    var recette_id : Int?
}

struct Etape: Hashable, Codable, Identifiable{
    var id : Int?
    var order : Int?
    var action : String?
    var recette_id : Int?
}
