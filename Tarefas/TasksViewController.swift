//
//  ViewController.swift
//  Tarefas
//
//  Created by Rodrigo Kreutz on 19/12/16.
//  Copyright © 2016 Rodrigo Kreutz. All rights reserved.
//

import UIKit
import Alamofire

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
    var tasks: [String] = []
    
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
        
        // Other configuration
        self.title = "Tarefas"
    }
    
    /********************************/
    // MARK: - Actions
    /********************************/
    func updateTasks() {
        let url = ProjectConfiguration.serverHost.stringByAppendingPathComponent(pathComponent: "tarefa")
        print("URL de serviço RESTful: \(url)")
        
        Alamofire.request(url).responseJSON { response in
            print("Resposta do serviço:")
            debugPrint(response)
            
            var error: String = ""
            switch response.result {
                case .failure(let err):
                    error = err.localizedDescription
                case .success(let result):
                    guard let result = result as? [String: Any], let list = result["lista"] as? [String] else {
                        error = "Alguma coisa deu errado ao tentar carregar lista de tarefas."
                        break
                    }
                    self.tasks = list
            }
            
            DispatchQueue.main.async {
                self.refreshControl.endRefreshing()
                self.tableView.reloadSections(IndexSet(integer: 0), with: .automatic)
                if !error.isEmpty {
                    let alert = UIAlertController(title: "Erro", message: error, preferredStyle: .alert)
                    let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alert.addAction(ok)
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
    
    /********************************/
    // MARK: - Requests completion handlers
    /********************************/
    
}

