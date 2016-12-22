//
//  DescriptionTableViewCell.swift
//  Tarefas
//
//  Created by Rodrigo Kreutz on 21/12/16.
//  Copyright © 2016 Rodrigo Kreutz. All rights reserved.
//

import UIKit
import MapKit

class DescriptionTableViewCell: UITableViewCell {
    /********************************/
    // MARK: - Static variables
    /********************************/
    static let cellIdentifier = "descriptionCell"
    
    /********************************/
    // MARK: - Outlets
    /********************************/
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var addressLabel: UILabel!
}
