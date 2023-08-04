//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by XP India  on 03/08/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewViewModel : ObservableObject{
    @Published var title = ""
    @Published var duedate: Date = Date()
    @Published var showAlert = false
    
    init() {}
    
    func save(){
        guard canSave else {
            return
        }
        //get current user id
        guard let uId = Auth.auth().currentUser?.uid else {return}
        
            //create model
        let newID = UUID().uuidString
        let newItem = ToDoListItem(id: newID,
                                   title: title,
                                   duedate: duedate.timeIntervalSince1970,
                                   createdDate: Date().timeIntervalSince1970,
                                   isDone: false)
        
        
        //save model
        let db = Firestore.firestore()
        db.collection("users").document(uId).collection("todos").document(newID).setData(newItem.asdictionary())
        
    }
    
    
    var  canSave: Bool{
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard duedate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        return true
    }
}

