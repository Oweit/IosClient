//
//  ContentView.swift
//  Owe It
//
//  Created by Jonathan Johannessen on 11/12/2020.
//  Copyright © 2020 Owe It. All rights reserved.
//

import SwiftUI



struct Login: View {
    @State var username: String = ""
    @State var password: String = ""
    
    
    var body: some View {
        VStack {
            Spacer()
            Image("logo")
                .resizable()
                .frame(width: 200.0, height: 200.0)
            VStack {
                HStack {
                    Image(systemName: "person").foregroundColor(.gray)
                    TextField("Brukernavn", text: $username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                    
                .scaledToFill()
                HStack {
                    Image(systemName: "lock").foregroundColor(.gray)
                    SecureField("Passord", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                    
                .scaledToFill()
                Button(action: {
                    sendCredentials(self.username, self.password)
                }) {
                    HStack {
                        Text("Logg inn")
                        Image(systemName: "arrow.right").foregroundColor(.gray)
                    }
                }
                Button(action: {
                    getTokenFromKeychain(self.username)
                }) {
                    HStack {
                        Text("Print Token")
                        Image(systemName: "arrow.right").foregroundColor(.gray)
                    }
                }
            }
            .scaledToFit()
            Spacer()
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
