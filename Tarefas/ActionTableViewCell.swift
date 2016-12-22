//
//  ActionTableViewCell.swift
//  Tarefas
//
//  Created by Rodrigo Kreutz on 21/12/16.
//  Copyright © 2016 Rodrigo Kreutz. All rights reserved.
//

import UIKit

protocol ActionTableViewCellDelegate {
    func call()
    func showServices()
    func showAddress()
    func showComments()
}

class ActionTableViewCell: UITableViewCell {
    /********************************/
    // MARK: - Static variables
    /********************************/
    static let cellIdentifier = "actionCell"
    
    /********************************/
    // MARK: - Instance variables
    /********************************/
    var delegate: ActionTableViewCellDelegate?
    
    /********************************/
    // MARK: - Actions
    /********************************/
    @IBAction func pressedCall(_ sender: Any) {
        self.delegate?.call()
    }
    
    @IBAction func pressedServices(_ sender: Any) {
        self.delegate?.showServices()
    }
    
    @IBAction func pressedAddress(_ sender: Any) {
        self.delegate?.showAddress()
    }
    
    @IBAction func pressedComments(_ sender: Any) {
        self.delegate?.showComments()
    }
    
}
