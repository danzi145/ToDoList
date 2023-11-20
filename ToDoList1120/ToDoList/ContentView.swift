//
//  ContentView.swift
//  ToDoList
//
//  Created by 박채운 on 2023/11/15.
//

import SwiftUI

struct ToDo : Codable {
    var id: Int
    var title: String
    var description: String
    var completed: Bool

}

//class ToDoList: ObservableObject {
//    @Published var todos: [ToDo]
//    init(todos: [ToDo] = []) {
//        self.todos = todos
//    }
//}


struct ContentView: View {
    @State private var todoData: [ToDo] = Bundle.main.load("sample.json")
    @State var stackPath = NavigationPath()
    
    var body: some View {
        
        
        NavigationStack(path: $stackPath) {
            List {
                ForEach(todoData.indices, id: \.self) { index in 
                    NavigationLink(destination: DetailView(todo: todoData[index])) {
                        Text(todoData[index].title)
                            .font(.headline)
                    }
                }
                .onDelete(perform: deleteItems)
                //.onMove(perform: moveItems) 이걸 넣으면 body에서 에러가 나옴
            }
       .navigationBarItems(leading: EditButton(), trailing: NavigationLink(destination: AddView(todoData: $todoData), label: {Text("Add")}))
            .navigationTitle(Text("ToDo"))
            
        }
    }

    func deleteItems(at offsets: IndexSet) {
        if let first = offsets.first {
            todoData.remove(at: first)
        }
    }
    
//    func moveItems(at index: Int) {
//        todoData[index].completed.toggle()
//    }
}


    
#Preview {
    ContentView()
}

