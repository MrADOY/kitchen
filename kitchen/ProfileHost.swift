//
//  ProfileHost.swift
//  kitchen
//
//  Created by Aurelien Pietrzak on 14/01/2020.
//

import SwiftUI

struct ProfileHost: View {
    var keyChainService: KeyChainService = KeyChainService()
    @State var logoutButton: Bool = false
    
    var body: some View {
        Button("Déconnexion"){
            self.keyChainService.delete(for: "access_token")
            self.logoutButton = true
        }.sheet(isPresented: $logoutButton, content: {
            LoginView()
        }).background(Color.black).foregroundColor(Color.white)
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
    }
}
