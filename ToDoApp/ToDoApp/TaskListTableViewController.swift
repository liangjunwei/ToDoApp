//
//  TaskListTableViewController.swift
//  ToDoApp
//
//  Created by Junwei Liang on 5/16/19.
//  Copyright © 2019 Junwei Liang. All rights reserved.
//

import UIKit

var taskStorage: TaskStoring = TaskStorage.shared

class TaskListTableViewController: UITableViewController {
    
    
    var store = UserDefaults.standard
    
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let decoder = JSONDecoder()
        
        if
            let storedTasksData = store.data(forKey: "tasks"),
            let tasks = try? decoder.decode(Array<Task>.self, from: storedTasksData)
        {
            taskStorage.taskArray = tasks
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskStorage.taskArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell") as? TaskCell
        else {
                return UITableViewCell()
        }
        cell.textLabel?.text = taskStorage.taskArray[indexPath.row].task
        print("something")
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            taskStorage.taskArray.remove(at: indexPath.row)
        }
        
        let encoder = JSONEncoder()
        
        if let taskData = try? encoder.encode(taskStorage.taskArray) {
            self.store.set(taskData, forKey: "tasks")
        }
        
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("task row: \(indexPath.row)")
    }
    
}
