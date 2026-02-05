//
//  AssignmentList.swift
//  Assignment Notebook
//
//  Created by Edwin Tovar on 2/3/26.
//

import Foundation

@Observable
class AssignmentList {
    var homeWork: [AssignmentItem] {
        didSet {
            if let homeWorkData = try? JSONEncoder().encode(homeWork) {
                UserDefaults.standard.set(homeWorkData, forKey: "homeWork")
            }
        }
    }
    init() {
        if let data = UserDefaults.standard.data(forKey: "homeWork") {
            if let homeWorkData = try? JSONDecoder().decode([AssignmentItem].self, from: data) {
                homeWork = homeWorkData
                return
            }
        }
        homeWork = []
    }
}
