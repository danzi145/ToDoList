//
//  DetailView.swift
//  ToDoList
//
//  Created by 박채운 on 2023/11/15.
//
import SwiftUI

 struct DetailView: View {
     @State var todo: ToDo
     
     
     var body: some View {
         ScrollView {
             VStack {
                 Text("\(todo.title)")
                     .font(.headline)
                 Text("\(todo.description)")
             }
         }
     }
 }

 struct DetailView_Previews: PreviewProvider {
     static var previews: some View {
         DetailView(todo: ToDo(id: 1, title: "", description: "", completed: true))
     }
 }




