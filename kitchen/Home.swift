//
//  Home.swift
//  kitchen
//
//  Created by Aurelien Pietrzak on 08/11/2019.
//

import SwiftUI

struct Home: View {
    var body: some View {
        TabView(selection: /*@START_MENU_TOKEN@*/ /*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
            HomeCategorie().tabItem { Text("Home") }.tag(
                1)
            Text("Tab Content 2").tabItem { Text("Tab Label 2") }.tag(2)
        }
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        //.edgesIgnoringSafeArea(.top)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
