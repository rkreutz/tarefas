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
        
        headerView.imageView.loadImage(fromUrl: self.place.urlPhoto)
        headerView.titleLabel.text = self.place.title
        headerView.logoView.loadImage(fromUrl: self.place.urlLogo)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return self.headerSize
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        tableView.bounces = tableView.contentSize.height > tableView.frame.size.height
    }
    
}
