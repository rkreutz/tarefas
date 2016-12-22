//
//  DetailViewController+ActionTableViewCellDelegate.swift
//  Tarefas
//
//  Created by Rodrigo Kreutz on 21/12/16.
//  Copyright © 2016 Rodrigo Kreutz. All rights reserved.
//

import UIKit

extension DetailViewController: ActionTableViewCellDelegate {
    
    func call() {
        guard let number = URL(string: "tel://" + self.place.phoneNumber) else {
            return
        }
        
        UIApplication.shared.open(number, options: [:], completionHandler: nil)
    }
    
    func showServices() {
        self.performSegue(withIdentifier: DetailViewController.servicesSegueIdentifier, sender: self)
    }
    
    func showAddress() {
        let alert = UIAlertController(title: "Endereço", message: self.place.address, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(ok)
        
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func showComments() {
        if self.place.comments.count > 0 {
            DispatchQueue.main.async {
                self.tableView.scrollToRow(at: IndexPath(row: 2, section: 0), at: .top, animated: true)
            }
        }
    }
    
}
