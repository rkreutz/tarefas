//
//  DetailViewController.swift
//  Tarefas
//
//  Created by Rodrigo Kreutz on 19/12/16.
//  Copyright © 2016 Rodrigo Kreutz. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    /********************************/
    // MARK: - Static variables
    /********************************/
    
    /********************************/
    // MARK: - Outlets
    /********************************/
    @IBOutlet weak var tableView: UITableView!
    
    /********************************/
    // MARK: - Instance variables
    /********************************/
    var place: Place!
    var headerSize: CGFloat = 100
    
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
        let headerViewNib = UINib(nibName: "DetailHeaderView", bundle: nil)
        tableView.register(headerViewNib, forHeaderFooterViewReuseIdentifier: DetailHeaderView.headerIdentifier)
        
        // Other configuration
        self.title = "\(self.place.city) - \(self.place.district)"
    }
}
