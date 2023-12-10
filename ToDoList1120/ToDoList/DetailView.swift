//
//  DetailView.swift
//  ToDoList
//
//  Created by 박채운 on 2023/11/15.
//
import SwiftUI

 struct DetailView: View {
     @Environment(\.managedObjectContext) private var viewContext
    var todoData: TodoData
     //@State var todo: ToDo
     
     
     var body: some View {
         ScrollView {
             VStack {
                 Text("\(todoData.dTitle ?? "")" )
                  .font(.headline)
                 Text("\(todoData.dContent ?? "")")
             }
         }
     }
     
     
     
     
     private func saveChanges() {
         do {
             try viewContext.save()
         } catch {
             print("Could not save changes: \(error)")
         }
     }
 }

