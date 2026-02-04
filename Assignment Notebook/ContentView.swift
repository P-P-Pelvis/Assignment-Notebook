//
//  ContentView.swift
//  Assignment Notebook
//
//  Created by Edwin Tovar on 2/3/26.
//

import SwiftUI

struct ContentView: View {
    @State private var assignmentItems =
    [AssignmentItem(course: "Algebra", description: "Linears Equations", dueDate: Date()),
     AssignmentItem(course: "History", description: "Civill War Paper", dueDate: Date()),
     AssignmentItem(course: "Science", description: "Atomic Bomb Lap", dueDate: Date())
    ]
    var body: some View {
        NavigationView {
            List {
                ForEach(assignmentItems) { item in
                    HStack {
                        VStack(alignment: .leading, content: {
                            Text(item.course).font(.headline)
                            Text(item.description)
                        })
                        Spacer()
                        Text(item.dueDate, style: .date)
                    }
                    
                }
                .onMove(perform: { indices, newOffset in
                    assignmentItems.move(fromOffsets: indices, toOffset: newOffset)
                })
                .onDelete(perform: { indexSet in
                    assignmentItems.remove(atOffsets: indexSet)
                })
            }
            .navigationBarTitle("Assignment Notebook")
            .navigationBarItems(leading: EditButton())
        }
    }
}

#Preview {
    ContentView()
}
struct AssignmentItem : Identifiable {
    var id = UUID()
    var course = String()
    var description = String()
    var dueDate = Date()
}
