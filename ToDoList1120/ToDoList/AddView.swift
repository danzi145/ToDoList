//
//  addView.swift
//  ToDoList
//
//  Created by 박채운 on 11/20/23.
//

import SwiftUI

struct AddView: View {
    @Binding var todoData: [ToDo]
    @State private var titleTextField = ""
    @State private var ContentTextField = ""
 
    var body: some View {
        
        VStack {
            Text("Title")
                .font(.headline)
                .offset(y: 10)
            TextField("", text: $titleTextField)
            SecureField("제목을 입력하세요", text: $titleTextField)
                .frame(height: 40)
                .padding()
                .background(Color(uiColor: .secondarySystemBackground))
                .textFieldStyle(.roundedBorder)
                      Text("ddd")
        }
    }


}
//
//#Preview {
//    AddView(todoData: Binding<[ToDo]>)
//}
//
