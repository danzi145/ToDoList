//
//  JsonManager.swift
//  ToDoListUITests
//
//  Created by 박채운 on 2023/11/15.
//

import Foundation
import SwiftUI

//struct ToDo : Codable, Hashable {
//    var id: Int
//    var title: String
//    var description: String
//    var completed: Bool
//
//}

//extension Bundle {
//    func load<T: Decodable>(_ filename: String) -> T {
//        let data: Data
//
//        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
//        else {
//            fatalError("Couldn't find \(filename) in main bundle.")
//        }
//
//        do {
//            data = try Data(contentsOf: file)
//        } catch {
//            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
//        }
//
//        do {
//            let decoder = JSONDecoder()
//            return try decoder.decode(T.self, from: data)
//        } catch {
//            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
//        }
//    }
//}
