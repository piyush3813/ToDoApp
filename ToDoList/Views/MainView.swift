//
//  ContentView.swift
//  ToDoList
//
//  Created by XP India  on 03/08/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserID.isEmpty{
          accountView
        }
        else {
            LoginView()
        }
        
    }
    
    @ViewBuilder
    var accountView: some View{
        TabView{
            ToDoListView(userId: viewModel.currentUserID)
                .tabItem {
                    Label("Home",  systemImage:"house")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile",systemImage: "person")
                }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
