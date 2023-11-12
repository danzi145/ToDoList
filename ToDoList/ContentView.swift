//
//  ContentView.swift
//  ToDoList
//
//  Created by 박채운 on 2023/11/12.
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
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(todoData, id: \.id) { i in
                    NavigationLink(destination: DetailView()) {
                        ListCell(todo: i)
                    }
                }
            }.navigationTitle("ToDo List")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
