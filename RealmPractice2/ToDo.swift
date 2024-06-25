//
//  ToDo.swift
//  RealmPractice2
//
//  Created by natsuko mizuno on 2024/06/20.
//

import Foundation
import RealmSwift

class ToDo: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: UUID = UUID()
    @Persisted var title: String = ""
}
