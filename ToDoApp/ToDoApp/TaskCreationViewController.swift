//
//  TripCreationViewController.swift
//  ToDoApp
//
//  Created by Junwei Liang on 5/16/19.
//  Copyright © 2019 Junwei Liang. All rights reserved.
//

import UIKit

class TaskCreationViewController: UIViewController {
    @IBOutlet weak var task: UITextField!
    
    var taskStorage: TaskStoring = TaskStorage.shared
    var store = UserDefaults.standard
    
    @IBAction func createTask(_ sender: Any) {
        
        guard
            let todoTask = task.text,
            !todoTask.isEmpty
        else {
                return
        }
        
        let newTask = Task(task: todoTask, check: false)
        taskStorage.insert(task: newTask)
        
        print(taskStorage.taskArray[0].task)
        
        let encoder = JSONEncoder()
        
        if let taskData = try? encoder.encode(self.taskStorage.taskArray) {
            self.store.set(taskData, forKey: "tasks")
        }
        
        dismiss(animated: true, completion: {print("dismissed!")})
    }
    
}
