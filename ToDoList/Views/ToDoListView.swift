//
//  ToDoListItems.swift
//  ToDoList
//
//  Created by XP India  on 03/08/23.
//
import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel : ToDoListViewViewModel
    @FirestoreQuery var items : [ToDoListItem]
    
    
    
    init(userId : String) {
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(
            wrappedValue: ToDoListViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack{
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button("Delete") {
                                viewModel.delete(id: item.id)
                                //delete
                            } .tint(Color.red)

                        }
                }
                .listStyle(.plain)
                
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    viewModel.showingNewItmView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            //
            .sheet(isPresented: $viewModel.showingNewItmView) {
                NewItemView( newItemPresented: $viewModel.showingNewItmView)
            }
        }
        
    }
}

struct ToDoListItems_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "FLPxLtaFP5VB6Wvgy5fAIBw5gyO2")
    }
}
