//
//  UserAuth.swift
//  Owe It
//
//  Created by Jonathan Johannessen on 14/12/2020.
//  Copyright © 2020 Owe It. All rights reserved.
//

import Foundation
import Security

func sendCredentials(_ email: String, _ password: String) {
    print(email)
    print(password)
    
    if let endpoint = URL(string: "https://backend.owe-it.com/auth/token/") { // Get endpoint for fetching auth token
        
        // Initializing the request with headers and body
        var request = URLRequest(url: endpoint)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let requestBody = ["email": email, "password": password]
        request.httpBody = try? JSONSerialization.data(withJSONObject: requestBody)
        
        // Initializing the dataTask with our predefined request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                print("Something wrong") //TODO: Better error handling
                return
            }
            do {
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) // TODO: Understand this
                
                // Parse JSON data
                if let json = jsonResult as? [String:Any] {
                    if let accessToken = json["access"] as? String { // Note-to-self: There must be a prettier way
                        print(accessToken)
                        
                        //Initialize keychain query for storing auth token in iOS Keychain
                        let query: [String: Any] = [kSecClass as String: kSecClassInternetPassword,
                                                    kSecAttrAccount as String: email,
                                                    kSecValueData as String: accessToken]
                        _ = SecItemAdd(query as CFDictionary, nil) // Store keychain
                        
                    }
                    else {
                        print("No token")
                    }
                }
            }
            catch let err {
                print(err)
            }
        }
        task.resume() // TODO: Find out why data task needs resume-method
    }
}

func getTokenFromKeychain(_ email: String) { // TODO: Fiks det her
    
    let query: [String: Any] = [kSecClass as String: kSecClassInternetPassword,
                                kSecAttrAccount as String: email,
                                kSecMatchLimit as String: kSecMatchLimitOne,
                                kSecReturnAttributes as String: true,
                                kSecReturnData as String: true]
    
    var item: CFTypeRef?
    _ = SecItemCopyMatching(query as CFDictionary, &item)
    
    if let existingItem = item as? [String : Any] {
        for (key, items) in existingItem {
            print(key, items)
        }}
    else{
        print("hey")
    }
//        let tokenData = existingItem[kSecValueData as String] as? Data,
//        let token = String(data: tokenData, encoding: String.Encoding.utf8) else {
//        print("Auth Token not working")
//        return
//    }
//    print(token)
}
