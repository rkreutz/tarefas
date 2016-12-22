//
//  DetailViewController+UITableViewDataSource.swift
//  Tarefas
//
//  Created by Rodrigo Kreutz on 20/12/16.
//  Copyright © 2016 Rodrigo Kreutz. All rights reserved.
//

import UIKit
import MapKit

extension DetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell!
        
        switch indexPath.row {
        case 0: // Cell with the actions
            let tmpCell = tableView.dequeueReusableCell(withIdentifier: ActionTableViewCell.cellIdentifier, for: indexPath) as! ActionTableViewCell
            
            tmpCell.delegate = self
            
            cell = tmpCell
        case 1: // Cell with the text and MapView
            let tmpCell = tableView.dequeueReusableCell(withIdentifier: DescriptionTableViewCell.cellIdentifier, for: indexPath) as! DescriptionTableViewCell
            let camera = MKMapCamera( lookingAtCenter: self.place.location, fromEyeCoordinate: self.place.location, eyeAltitude: 1000)
            
            tmpCell.descriptionLabel.text = self.place.text
            tmpCell.addressLabel.text = self.place.address
            tmpCell.mapView.setCamera(camera, animated: false)
            
            cell = tmpCell
        default: // Cells with comments
            let tmpCell = tableView.dequeueReusableCell(withIdentifier: CommentTableViewCell.cellIdentifier, for: indexPath) as! CommentTableViewCell
            
            // Here we just check to be sure our index path isn't out of range
            if indexPath.row - 2 >= 0 && indexPath.row - 2 < self.place.comments.count {
                let comment = self.place.comments[indexPath.row - 2]
                    
                tmpCell.nameLabel.text = comment.name
                tmpCell.titleLabel.text = comment.title
                tmpCell.descriptionLabel.text = comment.description
                tmpCell.profileImage.loadImage(fromUrl: comment.urlPhoto)
                tmpCell.ratingImage.image = UIImage(named: "rating\(comment.rating)")!
            }
            
            cell = tmpCell
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 1 cell for the actions + 1 cell for the text and map + N cells for the comments
        return 2 + self.place.comments.count
    }
    
}
