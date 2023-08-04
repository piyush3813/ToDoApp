//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by XP India  on 03/08/23.
//
import FirebaseFirestore

import Foundation

//view model for a list of item view
class ToDoListViewViewModel : ObservableObject{
    @Published var showingNewItmView = false
    private let userId :String
    init(userId : String) {
        self.userId = userId
    }
    
    func delete(id : String ) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
        
        
    }
    
   
}
