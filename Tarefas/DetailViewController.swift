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
    var minHeight: CGFloat = 0
    
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
        
        // Configuring the right button of the navigation bar
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: nil, action: nil)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        // Configuring the title of the navigation bar
        guard let bar = self.navigationController?.navigationBar,
            let rightButton = self.navigationItem.rightBarButtonItem else {
                return
        }
        
        let title = "\(self.place.city) - \(self.place.district)"
        let maxTitleWidth = bar.frame.width - rightButton.width - 120 - 16
        let imageSize = CGSize(width: 32, height: 32)
        let margin = CGFloat(8)
        
        let titleLabel = UILabel()
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 17)
        titleLabel.backgroundColor = UIColor.clear
        titleLabel.text = title
        
        let maxLabelWidth = titleLabel.intrinsicContentSize.width
        let labelWidth = maxTitleWidth - imageSize.width - margin < maxLabelWidth ? maxTitleWidth - imageSize.width - margin : maxLabelWidth
        
        titleLabel.frame = CGRect(x: imageSize.width + 2*margin, y: 0, width: labelWidth, height: 40)
        titleLabel.adjustsFontSizeToFitWidth = true
        
        let imageView = UIImageView(frame: CGRect(x: margin, y: 4, width: imageSize.width, height: imageSize.height))
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "location-white")
        
        let titleWidth = 3*margin + imageSize.width + labelWidth
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: titleWidth, height: 40))
        titleView.backgroundColor = UIColor.clear
        titleView.addSubview(titleLabel)
        titleView.addSubview(imageView)

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.navigationItem.titleView = titleView
        }
        // End of the configuration of the title. We update the title view after 0.5 seconds
        // So the left button is already loaded on the view and the title stays centered
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // Here we determine the minimal height the header needs to fill the whole table view
        let labelHeight = (self.tableView.headerView(forSection: 0) as! DetailHeaderView).titleLabel.frame.height
        let actualContenHeight = self.tableView.contentSize.height - self.headerSize
        var missingSpace = self.tableView.frame.height - labelHeight - actualContenHeight
        missingSpace = missingSpace > 0 ? missingSpace : 0
        
        self.minHeight = labelHeight + missingSpace
    }
}
