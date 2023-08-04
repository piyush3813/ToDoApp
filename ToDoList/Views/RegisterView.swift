//
//  RegisterView.swift
//  ToDoList
//
//  Created by XP India  on 03/08/23.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    var body: some View {
        
       
            VStack{
                //header
                HeaderView(title: "Register",
                           subtitle: "Start Organizing to Do",
                           angle: -15,
                           background: .orange)
                
                //form
                Form{
                    TextField("Full Name", text: $viewModel.name)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    TextField("email", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(title: "Register", background: .green)
                    {
                        viewModel.register()
                    }.padding()
                }
                .offset(y:-50)
            }
        }
    
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
