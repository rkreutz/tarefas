//
//  DetailHeaderView.swift
//  Tarefas
//
//  Created by Rodrigo Kreutz on 20/12/16.
//  Copyright © 2016 Rodrigo Kreutz. All rights reserved.
//

import UIKit

class DetailHeaderView: UITableViewHeaderFooterView {
    /********************************/
    // MARK: - Static variables
    /********************************/
    static let headerIdentifier = "headerView"
    
    /********************************/
    // MARK: - Outlets
    /********************************/
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageIndicator: UIActivityIndicatorView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var logoView: UIImageView!
    @IBOutlet weak var logoIndicator: UIActivityIndicatorView!

}
