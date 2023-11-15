//
//  ContentView.swift
//  ToDoList
//
//  Created by 박채운 on 2023/11/15.
//

import SwiftUI

struct ToDo : Codable, Identifiable {
    var id: Int
    var title: String
    var description: String
    var completed: Bool

}

class ToDoList: ObservableObject {
    @Published var todos: [ToDo]
    init(todos: [ToDo] = []) {
        self.todos = todos
    }
}


struct ContentView: View {
    
    @StateObject var todoList = ToDoList(todos: todoData)
    @State var stackPath = NavigationPath()
    
    var body: some View {
        
        
        NavigationStack(path: $stackPath) {
            List {
                ForEach(0..<todoList.todos.count, id: \.self) { i in
                    NavigationLink(value: i) {
                        ListCell(todo: todoList.todos[i])
                    }
                }
                .onDelete(perform: deleteItems)
                .onMove(perform: moveItems)
            }
            .navigationDestination(for: Int.self) { i in
                DetailView(todo: todoList.todos[i])
            }
            .navigationTitle(Text("To Do List"))
            .toolbar {
                
                
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarLeading) {
                    NavigationLink(value:"Add ") {
                        Text("Add")
                    }
                }
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
                    NavigationLink(value:"Add2") {
                        Text("Add2")
                    }
                    
                }
            }
        }
    }
        func deleteItems(at offsets: IndexSet) {
            todoList.todos.remove(atOffsets: offsets)
        }
        
        func moveItems(from source: IndexSet, to destination: Int) {
            todoList.todos.move(fromOffsets: source, toOffset: destination)
        }
    }


    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
