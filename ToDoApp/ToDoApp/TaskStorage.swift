//
//  TaskStorage.swift
//  ToDoApp
//
//  Created by Junwei Liang on 5/16/19.
//  Copyright © 2019 Junwei Liang. All rights reserved.
//

import Foundation
//this class store information about tasks
protocol TaskStoring {
    var taskArray: [Task] {get set}
    func insert(task: Task)
}

class TaskStorage: TaskStoring {
    
    static let shared = TaskStorage()
    
    private init() { }
    
    var taskArray: [Task] = []
    
    func insert(task: Task) {
        taskArray.append(task)
    }
}
