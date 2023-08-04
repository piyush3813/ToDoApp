//
//  ToDoListItemViewViewModel.swift
//  ToDoList
//
//  Created by XP India  on 03/08/23.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation
    //view model for a single of item view
class ToDoListItemViewViewModel : ObservableObject{
    init() {}
    
    func toggleIsDone(item: ToDoListItem){
        var itemCopy = item
        
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asdictionary())
        
    }
}

 
