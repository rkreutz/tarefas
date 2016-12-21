//
//  RoundedImageView.swift
//  Tarefas
//
//  Created by Rodrigo Kreutz on 21/12/16.
//  Copyright © 2016 Rodrigo Kreutz. All rights reserved.
//

import UIKit

class RoundedImageView: UIImageView {

    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = self.frame.width < self.frame.height ? self.frame.width/2 : self.frame.height/2
    }

}
