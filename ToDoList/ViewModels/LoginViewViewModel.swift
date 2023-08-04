//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by XP India  on 03/08/23.
//
import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {
        
    }
    
    func login(){
        guard validate() else {
            return
        }
            //authenticate
        Auth.auth().signIn(withEmail: email, password: password)
        print("Called")
        
    }
    
    private func validate() -> Bool{
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all fields"
            return false
        }
        //email validation
        guard email.contains("@")&&email.contains(".") else{
            errorMessage = "please enter valid email"
            return false
        }
        return true
    }
}
