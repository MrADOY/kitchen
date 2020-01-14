//
//  CategoryHome.swift
//  kitchen
//
//  Created by Aurelien Pietrzak on 07/11/2019.
//

import SwiftUI

struct HomeCategorie: View {

    @State var showingProfile: Bool = false
    @State var showingSearch: Bool = false
    
    @State private var selected = 0
    @EnvironmentObject var userData: UserData
    
    var categories: [String: [RecetteJson]] {
        Dictionary(
            grouping: self.userData.recetteDataJson,
            by: { $0.categories.rawValue }
        )
    }
    
    
    var profileButton: some View {
        Button(action: { self.showingProfile.toggle() }) {
            Image(systemName: "person.crop.circle")
                .imageScale(.large)
                .accessibility(label: Text("User Profile"))
                .padding()
        }
    }
    var searchButton: some View {
        Button(action: { self.showingSearch.toggle() }) {
            Image(systemName: "magnifyingglass")
                .imageScale(.large)
                .accessibility(label: Text("User Profile"))
                .padding()
        }
    }
    
    
    var body: some View {
        VStack{
        NavigationView {
            List {
                ForEach(categories.keys.sorted(), id: \.self) { key in
                    LigneCategorie(nomCategorie: key, items: self.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
                
                if (self.userData.recetteDataJson.filter { (recette : RecetteJson) -> Bool in
                    return recette.favorite
                }.count) == 0 {
                    EmptyView()
                } else{
                    LigneCategorie(nomCategorie: "Favoris", items: self.userData.recetteDataJson.filter{ ($0.favorite)})
                        .listRowInsets(EdgeInsets())
                }
            }.navigationBarTitle(Text("Recettes"))
                .navigationBarItems(trailing: HStack {
                    profileButton.sheet(isPresented: $showingProfile) {
                        ProfileHost()
                    };
                    searchButton.sheet(isPresented: $showingSearch) {
                        CustomSearchBar().environmentObject(UserData())
                    };
                })
          
            }
        }
    }
}

struct HomeCategorie_Previews: PreviewProvider {
    static var previews: some View {
        HomeCategorie()
    }
}


