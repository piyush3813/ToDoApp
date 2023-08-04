//
//  ToDoListItem.swift
//  ToDoList
//
//  Created by XP India  on 03/08/23.
//

import Foundation

struct ToDoListItem:Codable, Identifiable{
    let id : String
    let title: String
    let duedate: TimeInterval
    let createdDate : TimeInterval
    var isDone : Bool
    
    mutating func setDone(_ state:Bool){
        isDone = state
    }
}
