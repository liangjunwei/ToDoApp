//
//  EditTask.swift
//  ToDoApp
//
//  Created by Junwei Liang on 5/16/19.
//  Copyright © 2019 Junwei Liang. All rights reserved.
//

import UIKit

class EditTask: UIViewController {
    
    @IBOutlet weak var taskText: UITextField!
    var store = UserDefaults.standard
    
    
    
    @IBAction func checkButton(_ sender: Any) {
        taskStorage.taskArray[taskIndex].check = true
        
        let encoder = JSONEncoder()
        
        if let taskData = try? encoder.encode(taskStorage.taskArray) {
            self.store.set(taskData, forKey: "tasks")
        }
    }
    
    @IBAction func saveEditButton(_ sender: Any) {
        guard
            let editTask = taskText.text,
            !editTask.isEmpty
        else {
                return
        }
        
        taskStorage.taskArray[taskIndex].task = editTask
        
        let encoder = JSONEncoder()
        
        if let taskData = try? encoder.encode(taskStorage.taskArray) {
            self.store.set(taskData, forKey: "tasks")
        }
    }
    
}
