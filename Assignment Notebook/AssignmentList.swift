//
//  AssignmentList.swift
//  Assignment Notebook
//
//  Created by Edwin Tovar on 2/3/26.
//

import Foundation

@Observable
class AssignmentList {
    var items =
    [AssignmentItem(course: "Algebra", description: "Linears Equations", dueDate: Date()),
     AssignmentItem(course: "History", description: "Civill War Paper", dueDate: Date()),
     AssignmentItem(course: "Science", description: "Atomic Bomb Lap", dueDate: Date())
    ]
}
