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
    @State var toDoList = ["猫に餌をやる", "雨戸を開ける", "洗濯をする"]
    
    
    var body: some View {
        VStack {
            TextField("やることを入力", text: $inputTitle)
                .textFieldStyle(.roundedBorder)
                .padding(EdgeInsets(
                top: 10, leading: 10, bottom: 5, trailing: 10
                ))
            
            Button(action: {
                if !inputTitle.isEmpty {
                    toDoList.append(inputTitle)
                    inputTitle = ""
                } 
            }, label: {
                Text("追加")
            })
            .buttonStyle(RoundedButtonStyle())
            
            List {
                ForEach(toDoList, id: \.self) { toDo in
                    Text(toDo)
                } // ForEach
                .onDelete(perform: deleteTitles)
            } // List
        } // VStack
        
    } // body
    
    func deleteTitles(at offsets: IndexSet) {
        toDoList.remove(atOffsets: offsets)
    }
} // ContentView

#Preview {
    ContentView()
}
