//
//  DetailViewController+UITableViewDataSource.swift
//  Tarefas
//
//  Created by Rodrigo Kreutz on 20/12/16.
//  Copyright © 2016 Rodrigo Kreutz. All rights reserved.
//

import UIKit

extension DetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = "Cell \(indexPath.row)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
}
