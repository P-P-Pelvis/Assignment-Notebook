//
//  ContentView.swift
//  Assignment Notebook
//
//  Created by Edwin Tovar on 2/3/26.
//

import SwiftUI

struct ContentView: View {
    @State private var assignmentList = AssignmentList()
    @State private var showingAddItemView = false
    var body: some View {
        NavigationView {
            List {
                ForEach(assignmentList.homeWork) { list in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(list.course).font(.headline)
                            Text(list.description)
                                .preferredColorScheme(.dark)
                        }
                        Spacer()
                        Text(list.dueDate, style: .date)
                    }
                }
                .onMove(perform: { indices, newOffset in
                    assignmentList.homeWork.move(fromOffsets: indices, toOffset: newOffset)
                })
                .onDelete(perform: { indexSet in
                    assignmentList.homeWork.remove(atOffsets: indexSet)
                })
            }
            .sheet(isPresented: $showingAddItemView) {
                AddAssignmentView()
                    .environment(assignmentList)
            }
            .navigationBarTitle("Assignment Notebook")
            .navigationBarItems(leading: EditButton(),
                                trailing: Button(action: {
                showingAddItemView = true
            }, label: {
                Image(systemName: "plus")
            }))
        }
    }
}

#Preview {
    ContentView()
}
struct AssignmentItem : Identifiable, Codable {
    var id = UUID()
    var course = String()
    var description = String()
    var dueDate = Date()
}
struct customButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minWidth: 100)
            .font(.system(size: 20, weight: .semibold))
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white.opacity(configuration.isPressed ? 0.6 : 1.0))
            .foregroundColor(.black)
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
    }
}
