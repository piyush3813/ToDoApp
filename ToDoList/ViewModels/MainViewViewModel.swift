//
//  MainViewViewModel.swift
//  ToDoList
//
//  Created by XP India  on 03/08/23.
//

import Foundation
import FirebaseAuth
class MainViewViewModel: ObservableObject{
    @Published var currentUserID :String = ""
    private var  handler :AuthStateDidChangeListenerHandle?
    
    init(){
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserID = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn : Bool {
        return Auth.auth().currentUser != nil
    }
}
