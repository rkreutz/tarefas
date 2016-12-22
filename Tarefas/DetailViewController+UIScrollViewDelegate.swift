//
//  DetailViewController+UIScrollViewDelegate.swift
//  Tarefas
//
//  Created by Rodrigo Kreutz on 20/12/16.
//  Copyright © 2016 Rodrigo Kreutz. All rights reserved.
//

import UIKit

extension DetailViewController: UIScrollViewDelegate {
    
    // Here we do all the magic for the header animation. Autolayout constraints also are needed
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let yPos = scrollView.contentOffset.y
//        let maxHeight = ProjectConfiguration.detailHeaderMaxHeight
//        let minHeight = (self.tableView.headerView(forSection: 0) as! DetailHeaderView).titleLabel.frame.height
//        
//        if yPos < 0 {
////            if self.headerSize < maxHeight {
////                self.tableView.beginUpdates()
////                self.headerSize = self.headerSize - yPos <= maxHeight ? self.headerSize - yPos : maxHeight
////                self.headerSize = maxHeight
////                self.tableView.endUpdates()
////            }
//        } else if yPos > 0 {
//            if self.headerSize > minHeight {
//                self.tableView.beginUpdates()
////                self.headerSize = maxHeight - yPos >= minHeight ? maxHeight - yPos : minHeight
//                self.headerSize = minHeight
//                self.tableView.endUpdates()
//            }
//        }
//    }
//    
//    func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
//        let maxHeight = ProjectConfiguration.detailHeaderMaxHeight
//        
//        self.tableView.beginUpdates()
//        self.headerSize = maxHeight
//        self.tableView.endUpdates()
//    }
//    
//    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
////        let yPos = scrollView.contentOffset.y
////        let maxHeight = ProjectConfiguration.detailHeaderMaxHeight
////        if yPos < 0 {
////            if self.headerSize < maxHeight {
////                self.tableView.beginUpdates()
////                self.headerSize = self.headerSize - yPos <= maxHeight ? self.headerSize - yPos : maxHeight
////                self.headerSize = maxHeight
////                self.tableView.endUpdates()
////            }
////        }
//    }
//    
//    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
//        let yPos = scrollView.contentOffset.y
//        let maxHeight = ProjectConfiguration.detailHeaderMaxHeight
//        if yPos < 0 {
//            if self.headerSize < maxHeight {
//                self.tableView.beginUpdates()
//                self.headerSize = self.headerSize - yPos <= maxHeight ? self.headerSize - yPos : maxHeight
//                self.headerSize = maxHeight
//                self.tableView.endUpdates()
//            }
//        }
//    }
    
}
