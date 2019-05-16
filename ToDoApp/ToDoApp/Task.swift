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
    var check: Bool
    
    init(task: String, check: Bool) {
        self.task = task
        self.check = check
    }
}
