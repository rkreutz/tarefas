//
//  DetailViewController+UIScrollViewDelegate.swift
//  Tarefas
//
//  Created by Rodrigo Kreutz on 20/12/16.
//  Copyright © 2016 Rodrigo Kreutz. All rights reserved.
//

import UIKit

extension DetailViewController: UIScrollViewDelegate {
    
    // Here we do all the magic for the header animation. Autolayout constraints are also needed
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset
        
        if offset.y > 5 && self.headerSize > self.minHeight {
            UIView.animate(withDuration: 0.4, animations: {
                self.tableView.setContentOffset(offset, animated: false)
                self.tableView.beginUpdates()
                self.headerSize = self.minHeight
                self.tableView.endUpdates()
            })
        } else if offset.y < -5 && self.headerSize < ProjectConfiguration.detailHeaderMaxHeight {
            UIView.animate(withDuration: 0.4, animations: {
                self.tableView.setContentOffset(offset, animated: false)
                self.tableView.beginUpdates()
                self.headerSize = ProjectConfiguration.detailHeaderMaxHeight
                self.tableView.endUpdates()
            })
        }
    }
    
}
