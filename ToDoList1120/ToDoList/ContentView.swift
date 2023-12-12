//
//  ContentView.swift
//  ToDoList
//
//  Created by 박채운 on 2023/11/15.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    var add: AddView
    @FetchRequest(
            entity: TodoData.entity(),
             //오름차순으로 정렬
            sortDescriptors: [NSSortDescriptor(keyPath: \TodoData.dTitle, ascending: true)])
        var todo: FetchedResults<TodoData>
    
    //@State var todoData2: [ToDo] = Bundle.main.load("sample.json")
    
    
    
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(todo) { item in
                    NavigationLink(destination: DetailView(todoData: item)) {
                        Text(item.dTitle ?? "")
                            .font(.headline)
                    }
                }
                .onDelete(perform: deleteItems)
                .onMove(perform: moveItems)
                //.onMove{ todoData2.move(fromOffsets: $0, toOffset: $1) }
            }
            .navigationBarItems(leading: EditButton(), trailing: NavigationLink(destination: AddView(), label: {Text("Add")}))
            .navigationTitle(Text("ToDo"))
            .listStyle(PlainListStyle())
            .navigationViewStyle(StackNavigationViewStyle())
            
        }

    }

    func deleteItems(at offsets: IndexSet) {
        withAnimation {
                    saveContext()
                }
    }
    
    
    func moveItems(from source: IndexSet, to destination: Int) {
        withAnimation {
                    let new = TodoData(context: viewContext)
            new.dTitle = add.titleTextField
                    saveContext()
                }
        }
    
    
    func saveContext() {
        do {
                    try viewContext.save()
                } catch {
                    let nsError = error as NSError
                    fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                }
    }
}


    
#Preview {
    ContentView(add: AddView())
}
