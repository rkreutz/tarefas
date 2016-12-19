//
//  ViewController.swift
//  Tarefas
//
//  Created by Rodrigo Kreutz on 19/12/16.
//  Copyright © 2016 Rodrigo Kreutz. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController {
    /********************************/
    // MARK: - Outlets
    /********************************/
    @IBOutlet weak var tableView: UITableView!
    
    /********************************/
    // MARK: - Instance variables
    /********************************/
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(TasksViewController.updateTasks), for: UIControlEvents.valueChanged)
        
        return refreshControl
    }()
    
    /********************************/
    // MARK: - UIViewController functions
    /********************************/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Remove insets from the table view
        self.automaticallyAdjustsScrollViewInsets = false
        
        // Table view configuration
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.addSubview(self.refreshControl)
    }
    
    /********************************/
    // MARK: - Actions
    /********************************/
    func updateTasks() {
        self.refreshControl.endRefreshing()
    }
    
}

