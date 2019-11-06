//
//  UserData.swift
//  kitchen
//
//  Created by Aurelien Pietrzak on 06/11/2019.
//

import SwiftUI
import Combine

final class UserData: ObservableObject  {
    @Published var showFavoritesOnly = false
    @Published var recettes = recetteData
}
