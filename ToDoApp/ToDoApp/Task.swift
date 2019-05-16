//
//  Task.swift
//  ToDoApp
//
//  Created by Junwei Liang on 5/16/19.
//  Copyright © 2019 Junwei Liang. All rights reserved.
//

import UIKit

class Task: Codable {
    var task: String
    
    init(task: String) {
        self.task = task
    }
}
