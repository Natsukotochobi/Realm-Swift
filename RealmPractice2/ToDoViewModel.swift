//
//  ToDoViewModel.swift
//  RealmPractice2
//
//  Created by natsuko mizuno on 2024/06/25.
//

import Foundation
import RealmSwift

// ViewModel
class ToDoViewModel: ObservableObject {
    private var realm: Realm
    @Published var toDoList: [ToDo] = []

    init() {
        do {
            realm = try Realm()
            loadToDos()
        } catch {
            print("Failed to open Realm. Error: \(error.localizedDescription)")
            realm = try! Realm(configuration: .init(inMemoryIdentifier: "TemporaryRealm"))
        }
    }

    func loadToDos() {
        let todos = realm.objects(ToDo.self)
        toDoList = Array(todos)
    }

    func addToDo(title: String) {
        let newToDo = ToDo()
        newToDo.title = title

        do {
            try realm.write {
                realm.add(newToDo)
            }
            loadToDos()
        } catch {
            print("Failed to add ToDo. Error: \(error.localizedDescription)")
        }
    }

    func deleteToDos(at offsets: IndexSet) {
        offsets.map { toDoList[$0] }.forEach { toDo in
            do {
                try realm.write {
                    realm.delete(toDo)
                }
            } catch {
                print("Failed to delete ToDo. Error: \(error.localizedDescription)")
            }
        }
        loadToDos()
    }
}
