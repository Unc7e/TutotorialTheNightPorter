//
//  ViewController.swift
//  The Night Porter
//
//  Created by Yang Lu on 7/29/18.
//  Copyright © 2018 7. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // Table View Delegate Methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected row \(indexPath.row) in section \(indexPath.section)")
    }
    
    // Table View Data Source Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return dailyTasks.count
        case 1:
            return weeklyTasks.count
        case 2:
            return monthlyTasks.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let completeAction = UIContextualAction(style: .normal, title: "Complete") { (action: UIContextualAction, sourceView: UIView, actionPerformed: (Bool)->Void) in
            
            // find the right object and set it to completed
            switch indexPath.section{
            case 0:
                self.dailyTasks[indexPath.row].completed = true
            case 1:
                self.weeklyTasks[indexPath.row].completed = true
            case 2:
                self.monthlyTasks[indexPath.row].completed = true
            default:
                break
            }
            
            tableView.reloadData()
            
            actionPerformed(true)
        }
        
        return UISwipeActionsConfiguration(actions: [completeAction])
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = UITableViewCell()
        
        // to hold the current task
        var currentTask: Task!
        
        switch indexPath.section {
        case 0:
            currentTask = dailyTasks[indexPath.row]
        case 1:
            currentTask = weeklyTasks[indexPath.row]
        case 2:
            currentTask = monthlyTasks[indexPath.row]
        default:
            break
        }
        
        // use the name property to set the value of the cell
        myCell.textLabel!.text = currentTask.name
        
        if currentTask.completed{
            myCell.textLabel?.textColor = UIColor.lightGray
            myCell.accessoryType = .checkmark
        }else{
            myCell.textLabel?.textColor = UIColor.black
            myCell.accessoryType = .none
        }
        
        // clear out the background
        myCell.backgroundColor = UIColor.clear
        
        return myCell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Daily Tasks"
        case 1:
            return "Weekly Tasks"
        case 2:
            return "Monthly Tasks"
        default:
            return "This shouldn't happen"
        }
    }
    
    
    // Create [String] arrays of tasks
    var dailyTasks = [
        Task(name: "Check all windows", type: .daily, completed: false, lastCompleted: nil),
        Task(name: "Check all doors", type: .daily, completed: false, lastCompleted:nil),
        Task(name:"Is the boiler fueled?",type: .daily, completed:false, lastCompleted:nil),
        Task(name: "Check the mailbox", type: .daily, completed: false, lastCompleted: nil),
        Task(name: "Empty trash containers", type: .daily, completed: false, lastCompleted: nil),
        Task(name: "If freezing, check water pipes", type: .daily, completed: true, lastCompleted: nil),
        Task(name:"Document \"strange and unusual\" occurences", type: .daily, completed:false, lastCompleted:nil)
    ]
    
    var weeklyTasks = [
        Task(name: "Check inside all cabins", type:.weekly, completed:false, lastCompleted: nil),
        Task(name: "Flush all lavatories in cabins", type: .weekly, completed: false, lastCompleted: nil),
        Task(name: "Walk the perimeter of property", type: .weekly, completed: false, lastCompleted: nil)
    ]
    
    var monthlyTasks = [
        Task(name: "Test security alarm", type:.monthly, completed: false, lastCompleted: nil),
        Task(name: "Test motion detectors", type: .monthly, completed: false, lastCompleted: nil),
        Task(name: "Test smoke alarms", type: .monthly, completed: false, lastCompleted: nil)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "TableView Demo"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

