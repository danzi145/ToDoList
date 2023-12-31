//
//  addView.swift
//  ToDoList
//
//  Created by 박채운 on 11/20/23.
//

import Foundation
import SwiftUI

//class Todolists: ObservableObject {
//    @Published var list = [ToDo]()
//}

struct AddView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) var dismiss
    
   // @Binding var todoData: TodoData
    //@Binding var todoData2: [ToDo]
    @State var titleTextField = ""
    @State private var ContentTextField = ""
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("제목을 입력하세요", text: $titleTextField)
                    .frame(height: 40)
                    .padding()
                    .textFieldStyle(.roundedBorder)
                TextEditor(text: $ContentTextField)
                    .frame(maxWidth: 365, minHeight: 100, maxHeight: 200)
                  .border(Color.gray, width: 0)
                  .textEditorStyle(.automatic)
                Button {
                    addNewList()
                } label: {
                    Text("Add")
                }
                .font(Font.body.weight(.bold))
                    .frame(width: 100, height: 40)
                    .background(Color(uiColor: .white))
                
            }
        }
        .background(Color(uiColor: .secondarySystemBackground))
        .navigationTitle("Add new item")
    }
    func addNewList() {
        let newTodo = TodoData(context: viewContext)
        newTodo.dTitle = titleTextField
        newTodo.dContent = ContentTextField
        
        do {
            try viewContext.save()
            dismiss()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
//    func addNewList() {
//        let inputList = ToDo(id: 1, title: titleTextField, description: ContentTextField, completed: false)
//        //todoData2.append(inputList)
//        titleTextField = ""
//        ContentTextField = ""
//    }
}



//
//#Preview {
//    AddView(todoData: Binding<[ToDo]>)
//}

