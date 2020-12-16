//
//  Structures.swift
//  Owe It
//
//  Created by Jonathan Johannessen on 16/12/2020.
//  Copyright © 2020 Owe It. All rights reserved.
//

import Foundation

struct Reason: Identifiable, Codable {
    var name: String?
    var id: String?
    var text: String?
    var ranking: Int?
    var punishment: Int?
    var slackName: String?
}

struct Penalty: Identifiable, Codable  {
    var reason: Reason?
    var id: String?
    var multiplier: Int?
    var punishment: Int?
    var date: String?
}

struct Member: Identifiable, Codable  {
    var name: String?
    var isAdmin: Bool?
    var penalty: [Penalty]?
    var id: String?
    var email: String?
    var founder: Bool?
    var developer: Bool?
}

struct Group: Identifiable, Codable  {
    var name: String?
    var id: String?
    var members: [Member]?
    var reason_set: [Reason]?
    var user_is_admin: Bool?
}
