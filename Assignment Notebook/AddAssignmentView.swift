//
//  AddAssignmentView.swift
//  Assignment Notebook
//
//  Created by Edwin Tovar on 2/3/26.
//

import SwiftUI

struct AddAssignmentView: View {
    @Environment(AssignmentList.self) var assignmentList
    @Environment(\.presentationMode) var presentationMode
    static let courses = ["Algebra", "History", "Science","English","Art"]
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
            }
        }
    }
}

