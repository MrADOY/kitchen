//
//  RecettesDataJson.swift
//  kitchen
//
//  Created by Aurelien Pietrzak on 12/01/2020.
//

import Foundation
import Combine
import SwiftUI

final class RecettesListModel : ObservableObject {
    
    init(){
        fetchRecipes()
    }

    var objectWillChange = PassthroughSubject<Void, Never>()

    var recettes: [RecetteJson] = [] {
        willSet {
            self.objectWillChange.send()
        }
    }
    
    private func fetchRecipes() {
        WebService().getAllRecipes{
            self.recettes = $0
            print("list: \(self.recettes[0].name)")
        }
    }
    
}
