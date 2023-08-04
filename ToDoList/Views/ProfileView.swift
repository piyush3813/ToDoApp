//
//  ProfileView.swift
//  ToDoList
//
//  Created by XP India  on 03/08/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    var body: some View {
        NavigationView {
            VStack{
                //avatar
                if let user = viewModel.user{
                    
                    
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color.blue)
                        .frame(width: 125, height: 125)
                        .padding()
                    //info: name email menmber since
                    
                    VStack(alignment: .leading){
                        HStack{
                            Text("Name: ")
                                .bold()
                            Text(user.name)
                        }
                        .padding()
                        HStack{
                            Text("Email: ")
                                .bold()
                            Text(user.email)
                        }
                        .padding()
                        HStack{
                            Text("Member since: ")
                                .bold()
                            Text("\(Date(timeIntervalSince1970: user.joinedDate).formatted(date: .abbreviated, time: .shortened))")
                        }
                        .padding()
                    }
                    .padding()
                    
                    Button("Logout"){
                        viewModel.logout()
                    }.tint(.red)
                    Spacer()
                }else{
                    Text("Loading Profile.....")
                }
                
            }
            .navigationTitle("User Profile")
        }.onAppear{
            viewModel.fetchUser()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
