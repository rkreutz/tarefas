//
//  CommentTableViewCell.swift
//  Tarefas
//
//  Created by Rodrigo Kreutz on 21/12/16.
//  Copyright © 2016 Rodrigo Kreutz. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {
    /********************************/
    // MARK: - Static variables
    /********************************/
    static let cellIdentifier = "commentCell"
    
    /********************************/
    // MARK: - Outlets
    /********************************/
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var profileImage: RoundedImageView!
    @IBOutlet weak var ratingImage: UIImageView!

}
