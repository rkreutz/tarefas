//
//  ViewController.swift
//  Tarefas
//
//  Created by Rodrigo Kreutz on 19/12/16.
//  Copyright © 2016 Rodrigo Kreutz. All rights reserved.
//

import UIKit
import Alamofire

class PlacesViewController: UIViewController {
    /********************************/
    // MARK: - Static variables
    /********************************/
    static let detailSegueIdentifier = "showDetail"
    
    /********************************/
    // MARK: - Outlets
    /********************************/
    @IBOutlet weak var tableView: UITableView!
    
    /********************************/
    // MARK: - Instance variables
    /********************************/
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(PlacesViewController.updatePlaces), for: UIControlEvents.valueChanged)
        return refreshControl
    }()
    var places: [String] = []
    
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
        self.title = "Tarefa"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if self.places.count == 0 {
            // First we dislocate the table view so the refresh control is visible, then we start updating
            self.tableView.setContentOffset(CGPoint(x: 0, y: -self.refreshControl.frame.height), animated: true)
            self.refreshControl.beginRefreshing()
            self.updatePlaces()
        }
    }
    
    /********************************/
    // MARK: - Actions
    /********************************/
    func updatePlaces() {
        RequestManager.updatePlaces { (list: [String]?, errorMsg: String?) in
            // Update UI
            DispatchQueue.main.async {
                self.refreshControl.endRefreshing()
                self.tableView.reloadSections(IndexSet(integer: 0), with: .automatic)
            }
            
            // If there were an error we'll present it to the user
            if let errorMsg = errorMsg {
                let alert = UIAlertController(title: "Erro", message: errorMsg, preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(ok)
                
                DispatchQueue.main.async {
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
    
}

