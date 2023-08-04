//
//  Users.swift
//  ToDoList
//
//  Created by XP India  on 03/08/23.
//

import Foundation

struct User: Codable{
    let id: String
    let name: String
    let email: String
    let joinedDate: TimeInterval
}
