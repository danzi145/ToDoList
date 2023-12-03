//
//  ContentView.swift
//  ToDoList
//
//  Created by 박채운 on 2023/11/15.
//

import SwiftUI

struct ToDo : Identifiable, Codable {
    var id: Int
    var title: String
    var description: String
    var completed: Bool

}
//List {
//    ForEach(todoData.indices, id: \.self) { index in
//        NavigationLink(destination: DetailView(todo: todoData[index])) {
//            Text(todoData[index].title)
//                .font(.headline)
//        }
//    }
//    .onDelete(perform: deleteItems)
//    List(todoData) { item in ListCell(item) }
//NavigationSplitView {
//        List(colors, id: \.self, selection: $selection) { color in
//            NavigationLink(color.description, value: color)
//        }

struct ContentView: View {
    @State var todoData2: [ToDo] = Bundle.main.load("sample.json")
    
    var body: some View {
        
        
        NavigationView {
            List {
                ForEach(todoData2.indices, id: \.self) { index in
                    NavigationLink(destination: DetailView(todo: todoData2[index])) {
                        Text(todoData2[index].title)
                            .font(.headline)
                    }
                }
                .onDelete(perform: deleteItems)
                .onMove{ todoData2.move(fromOffsets: $0, toOffset: $1) }
            }
       .navigationBarItems(leading: EditButton(), trailing: NavigationLink(destination: AddView(todoData2: $todoData2), label: {Text("Add")}))
            .navigationTitle(Text("ToDo"))
            
        }
    }

    func deleteItems(at offsets: IndexSet) {
        if let first = offsets.first {
            todoData2.remove(at: first)
        }
    }
    
    func moveItems(at index: Int) {
        todoData2[index].completed.toggle()
    }
}


    
#Preview {
    ContentView()
}

