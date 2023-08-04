//
//  NewItemView.swift
//  ToDoList
//
//  Created by XP India  on 03/08/23.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented:Bool
   
    var body: some View {
        VStack{
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 100)
            
            Form{
                //title
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                
                //DueDate
                DatePicker("Due Date", selection: $viewModel.duedate)
                    .datePickerStyle(.graphical)
                
                //button
                
                TLButton(title: "Save", background: .pink) {
                    //save function
                    if viewModel.canSave{
                        viewModel.save()
                        newItemPresented = false
                    }else {
                        viewModel.showAlert = true
                    }
 
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"),message: Text("Please fill in all fields nd select due date that is today or newer."))
                
            }
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView( newItemPresented: Binding(get: {
            return true
        }, set: { _ in
            
        }))
    }
}
