//
//  LoginView.swift
//  ToDoList
//
//  Created by XP India  on 03/08/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    var body: some View {
        NavigationView {
            VStack{
                //header
                HeaderView(title: "To Do List", subtitle: "Get Things Done", angle: 15, background: .pink)
                //loginform
                
                
                Form{
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    SecureField("Enter Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(title: "Login",
                             background: .blue)
                    {
                        viewModel.login()
                    }
                        .padding()
                    
                }
                .offset(y:-50)
                
                //create account
                
                VStack{
                    Text("New around here?")
                    NavigationLink("Create an account", destination: RegisterView())
                    
                    
                }.padding(.bottom,50)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
