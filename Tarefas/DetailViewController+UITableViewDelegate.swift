//
//  DetailViewController+UITableViewDelegate.swift
//  Tarefas
//
//  Created by Rodrigo Kreutz on 20/12/16.
//  Copyright © 2016 Rodrigo Kreutz. All rights reserved.
//

import UIKit

extension DetailViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: DetailHeaderView.headerIdentifier) as! DetailHeaderView
        
        headerView.titleLabel.text = self.place.title
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return self.headerSize
    }
    
}
