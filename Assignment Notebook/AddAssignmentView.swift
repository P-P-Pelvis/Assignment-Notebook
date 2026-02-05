//
//  AddAssignmentView.swift
//  Assignment Notebook
//
//  Created by Edwin Tovar on 2/3/26.
//

import SwiftUI

struct AddAssignmentView: View {
    @Environment(AssignmentList.self) var assignmentList
    @Environment(\.dismiss) var fooFighters
    static let courses = ["Algebra", "History", "CompSci","English","Art"]
    @State private var course = ""
    @State private var description = ""
    @State private var dueDate = Date()
    var body: some View {
        NavigationView {
            Form {
                Picker("Course", selection: $course) {
                    ForEach(Self.courses, id: \.self) { course in
                        Text(course)
                    }
                }
                TextField("Description", text: $description)
                DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
            }
            .navigationBarTitle("Add New Assignment", displayMode: .inline)
            .navigationBarItems(trailing: Button("save") {
                if course.count > 0, description.count > 0 {
                let homeWork = AssignmentItem(course: course, description: description, dueDate:
                                            dueDate)
                    assignmentList.homeWork.append(homeWork)
                    fooFighters()
            }
        })
    }
}
}

