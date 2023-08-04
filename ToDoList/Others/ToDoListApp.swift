//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by XP India  on 03/08/23.
//

import SwiftUI
import FirebaseCore

@main
struct ToDoListApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
