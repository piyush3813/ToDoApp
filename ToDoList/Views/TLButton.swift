//
//  TLButton.swift
//  ToDoList
//
//  Created by XP India  on 03/08/23.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    var body: some View {
       
        Button {
            action()
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                Text(title)
                    .foregroundColor(.white)
                    .bold()
            }
        }
        
    }
}

struct TLButton_Previews: PreviewProvider {
    static var previews: some View {
        TLButton(title: "Title", background: .blue){
            //action performed
        }
    }
}
