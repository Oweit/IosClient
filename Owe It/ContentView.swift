//
//  ContentView.swift
//  Owe It
//
//  Created by Jonathan Johannessen on 11/12/2020.
//  Copyright © 2020 Owe It. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack {
            Spacer()
            Image("logo")
                .resizable().frame(width: 200.0, height: 200.0)
            VStack {
                HStack {
                    Image(systemName: "person").foregroundColor(.gray)
                    TextField("Brukernavn", text: $username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .scaledToFill()
                HStack {
                    Image(systemName: "lock").foregroundColor(.gray)
                    TextField("Passord", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .scaledToFill()
                Button(action: {}) {
                    HStack {
                        Text("Logg inn")
                        Image(systemName: "arrow.right").foregroundColor(.gray)
                    }
                }
            }
            .scaledToFit()
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
