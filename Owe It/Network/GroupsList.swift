//
//  GroupsList.swift
//  Owe It
//
//  Created by Jonathan Johannessen on 16/12/2020.
//  Copyright © 2020 Owe It. All rights reserved.
//

import Foundation

func getAllInfo() {
    print("here")
    print(Authentication.token)
    
    if let endpoint = URL(string: "https://backend.owe-it.com/api/groups/") { // Get endpoint for fetching auth token
        
        // Initializing the request with headers and body
        var request = URLRequest(url: endpoint)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(Authentication.token)", forHTTPHeaderField: "Authorization")
        // Initializing the dataTask with our predefined request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                print("Something wrong") //TODO: Better error handling
                return
            }
            do {
                let decoder = JSONDecoder()
                let groups: [Group] = try decoder.decode([Group].self, from: data)
                for group in groups {
                    print(group.name)
                }
//                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) // TODO: Understand this
//
//                // Parse JSON data
//                if let json = jsonResult as? [[String:Any]] {
//                    for (key, value) in json[0] {
//                        print(key)
//                        print(value)
//                    }
//                }
//                else {
//                    print("Not jsonresult?")
//                }
            }
            catch let err {
                print(err)
            }
        }
        task.resume() // TODO: Find out why data task needs resume-method
    }
}
