//
//  UserData.swift
//  kitchen
//
//  Created by Aurelien Pietrzak on 06/11/2019.
//

import SwiftUI
import Combine

final class UserData: ObservableObject  {
    init() {
        WebService().getAllRecipes{
           self.recetteDataJson = $0
            print(self.recetteDataJson)
        }
    }
    @Published var showFavoritesOnly = false
    @Published var recetteDataJson : [RecetteJson] = [];
    @Published var text : String = "";
}
