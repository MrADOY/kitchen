//
//  LoginView.swift
//  kitchen
//
//  Created by Aurelien Pietrzak on 13/01/2020.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State var isModal: Bool = false
        @State var message: String = ""
    var body: some View {
        VStack {
          TextField("Email", text: self.$email)
          SecureField("Password", text: self.$password)
               Text("\(self.message)").foregroundColor(Color.red)
            Button("Connexion"){
                 WebService().postLogin(email: self.email,password: self.password) {
                     self.isModal = $0
                     if !self.isModal {
                         self.message = "Email ou mot de passe incorrect"
                     }
                 }

             }.sheet(isPresented: $isModal, content: {
                 HomeCategorie().environmentObject(UserData())
             })
    }
}
}
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
