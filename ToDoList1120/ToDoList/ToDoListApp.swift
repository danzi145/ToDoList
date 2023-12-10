//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by 박채운 on 2023/11/15.
//

import SwiftUI
import CoreData
@main
struct ToDoListApp: App {
   let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            ContentView(add: AddView())
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

struct PersistenceController {
  static let shared = PersistenceController()

  let container: NSPersistentContainer

    
    
    
    
  init(inMemory: Bool = false) {
    container = NSPersistentContainer(name: "TodoData")
    container.loadPersistentStores { _, error in
      if let error = error as NSError? {
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    }
  }

}
