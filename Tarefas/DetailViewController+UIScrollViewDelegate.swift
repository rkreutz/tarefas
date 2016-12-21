//
//  DetailViewController+UIScrollViewDelegate.swift
//  Tarefas
//
//  Created by Rodrigo Kreutz on 20/12/16.
//  Copyright © 2016 Rodrigo Kreutz. All rights reserved.
//

import UIKit

extension DetailViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yPos = scrollView.contentOffset.y
        print(yPos)
        
        if yPos > 0 {
            if self.headerSize > 40 {
                self.tableView.beginUpdates()
                self.headerSize = 300 - yPos >= 40 ? 300 - yPos : 40
                self.tableView.endUpdates()
            }
        } else {
            if self.headerSize < 300 {
                self.tableView.beginUpdates()
                self.headerSize = self.headerSize - yPos <= 300 ? self.headerSize - yPos : 300
                self.tableView.endUpdates()
            }
        }
    }
    
}
