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
            
            // URL will be the server endpoint concatenated with the path 'tarefa' concatenated with the path of the place itself
            let url = ProjectConfiguration.serverHost.stringByAppendingPathComponent(pathComponent: "tarefa").stringByAppendingPathComponent(pathComponent: self.places[indexPath.row])
            print("URL de serviço RESTful: \(url)")
            
            Alamofire.request(url).responseJSON(completionHandler: { response in
                var error: String = ""
                var place: Place!
                
                print("Resposta do serviço:")
                debugPrint(response)
                
                // Checks for any error and the data that was fetched
                switch response.result {
                case .failure(let err):
                    error = err.localizedDescription
                case .success(let result):
                    guard let result = result as? [String: Any] else {
                        error = "Alguma coisa deu errado ao tentar carregar detalhes da tarefa."
                        break
                    }
                    place = Place(dict: result)
                }
                
                DispatchQueue.main.async {
                    // We enable all interactions
                    tableView.allowsSelection = true
                    tableView.addSubview(self.refreshControl)
                    
                    // And stop the indicator for the cell detail
                    cell.activityIndicator.stopAnimating()
                    
                    // If there were no errors we shall proceed to the detail view
                    // Otherwise we present the error to the user
                    if error.isEmpty {
                        print(place)
                    } else {
                        let alert = UIAlertController(title: "Erro", message: error, preferredStyle: .alert)
                        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
                        alert.addAction(ok)
                        self.present(alert, animated: true, completion: nil)
                    }
                }
            })
        }
    }
    
}
