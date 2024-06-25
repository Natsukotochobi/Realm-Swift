//
//  ContentView.swift
//  RealmPractice2
//
//  Created by natsuko mizuno on 2024/06/19.
//

import SwiftUI

struct RoundedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(EdgeInsets(
                top: 7, leading: 10, bottom: 7, trailing: 10
            ))
            .foregroundColor(.white)
            .background(.blue)
            .cornerRadius(7)
            .opacity(configuration.isPressed ? 0.5 : 1)
    }
}


struct ContentView: View {
    @State var inputTitle: String = ""
    @StateObject private var viewModel = ToDoViewModel()
    
    
    var body: some View {
        VStack {
            TextField("やることを入力", text: $inputTitle)
                .textFieldStyle(.roundedBorder)
                .padding(EdgeInsets(
                top: 10, leading: 10, bottom: 5, trailing: 10
                ))
            
            Button(action: {
                if !inputTitle.isEmpty {
                    viewModel.addToDo(title: inputTitle)
                    inputTitle = ""
                } 
            }, label: {
                Text("追加")
            })
            .buttonStyle(RoundedButtonStyle())
            
            List {
                ForEach(viewModel.toDoList) { toDo in
                    Text(toDo.title)
                } // ForEach
                .onDelete(perform: viewModel.deleteToDos)
            } // List
        } // VStack
        
    } // body
} // ContentView

#Preview {
    ContentView()
}
