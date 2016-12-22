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
    static let servicesSegueIdentifier = "showServices"
    
    /********************************/
    // MARK: - Outlets
    /********************************/
    @IBOutlet weak var tableView: UITableView!
    
    /********************************/
    // MARK: - Instance variables
    /********************************/
    var place: Place!
    var headerSize: CGFloat = ProjectConfiguration.detailHeaderMaxHeight
    
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
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 64
        
        // Other configuration
        self.title = "\(self.place.city) - \(self.place.district)"
        
        print(self.place)
    }
}
