//
//  TaskTableViewCell.swift
//  Tarefas
//
//  Created by Rodrigo Kreutz on 19/12/16.
//  Copyright © 2016 Rodrigo Kreutz. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    /********************************/
    // MARK: - Static variables
    /********************************/
    static let cellIdentifier = "taskCell"
    
    /********************************/
    // MARK: - Outlets
    /********************************/
    @IBOutlet weak var titleLabel: UILabel!
    
    /********************************/
    // MARK: - UITableViewCell functions
    /********************************/
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        if selected {
            self.setSelected(false, animated: true)
        }
    }

}
