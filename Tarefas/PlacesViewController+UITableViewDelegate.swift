//
//  PlacesViewController+UITableViewDelegate.swift
//  Tarefas
//
//  Created by Rodrigo Kreutz on 19/12/16.
//  Copyright © 2016 Rodrigo Kreutz. All rights reserved.
//

import UIKit
import Alamofire

extension PlacesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? PlaceTableViewCell {
            // Disables any interaction which may lead to another request
            tableView.allowsSelection = false
            self.refreshControl.removeFromSuperview()
            
            // Indicates the cell information is beeing loaded
            cell.activityIndicator.startAnimating()
            
            RequestManager.fetchPlaceDetail(place: self.places[indexPath.row]) { (place: Place?, errorMsg: String?) in
                DispatchQueue.main.async {
                    // We enable all interactions
                    tableView.allowsSelection = true
                    tableView.addSubview(self.refreshControl)
                    
                    // And stop the indicator for the cell detail
                    cell.activityIndicator.stopAnimating()
                }
                
                // If there were no errors we shall proceed to the detail view
                // Otherwise we present the error to the user
                if let errorMsg = errorMsg {
                    let alert = UIAlertController(title: "Erro", message: errorMsg, preferredStyle: .alert)
                    let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alert.addAction(ok)
                    
                    DispatchQueue.main.async {
                        self.present(alert, animated: true, completion: nil)
                    }
                } else {
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: PlacesViewController.detailSegueIdentifier, sender: place)
                    }
                }
            }
        }
    }
    
}
