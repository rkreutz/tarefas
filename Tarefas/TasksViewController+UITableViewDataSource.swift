//
//  TasksViewController+UITableViewDataSource.swift
//  Tarefas
//
//  Created by Rodrigo Kreutz on 19/12/16.
//  Copyright © 2016 Rodrigo Kreutz. All rights reserved.
//

import UIKit

extension TasksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TaskTableViewCell.cellIdentifier, for: indexPath) as! TaskTableViewCell
        
        cell.titleLabel.text = self.tasks[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tasks.count
    }
}
