//
//  TodoData+CoreDataProperties.swift
//  ToDoList
//
//  Created by 박채운 on 12/10/23.
//
//

import Foundation
import CoreData


extension TodoData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TodoData> {
        return NSFetchRequest<TodoData>(entityName: "TodoData")
    }

    @NSManaged public var dTitle: String?
    @NSManaged public var dContent: String?

}

extension TodoData : Identifiable {

}
