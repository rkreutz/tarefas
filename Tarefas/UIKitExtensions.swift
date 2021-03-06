//
//  UIKitExtensions.swift
//  Tarefas
//
//  Created by Rodrigo Kreutz on 19/12/16.
//  Copyright © 2016 Rodrigo Kreutz. All rights reserved.
//

import UIKit

/********************************/
// MARK: - String extensions
/********************************/
extension String {
    
    // Will append path component to a string. It will keep the format of an http url string
    public func stringByAppendingPathComponent(pathComponent: String) -> String {
        var str = (self as NSString).appendingPathComponent(pathComponent)
        if str.contains("http:/") && !str.contains("http://") {
            str.insert("/", at: str.index(str.startIndex, offsetBy: 6))
        }
        return str
    }
    
}

/********************************/
// MARK: - UIImageView extensions
/********************************/
extension UIImageView {
    
    // Will load an image from the URL specified. While it is loading an activity indicator
    // will be shown on the center of the image view.
    public func loadImage(fromUrl strUrl: String) {
        self.image = nil
        
        // Activity indicator to be shown
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        // Constraints for the activity indicator
        let centerVertically = NSLayoutConstraint(item: activityIndicator, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0)
        let centerHorizontally = NSLayoutConstraint(item: activityIndicator, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0)
        
        // Adding the activity indicator to the view hierarchy and the constraints
        self.addSubview(activityIndicator)
        self.addConstraints([centerVertically, centerHorizontally])
        
        // Update UI
        DispatchQueue.main.async {
            activityIndicator.startAnimating()
            self.layoutIfNeeded()
        }
        
        // Will load asynchronously the image
        DispatchQueue.global().async {
            guard let url = URL(string: strUrl),
                let data = try? Data(contentsOf: url),
                let image = UIImage(data: data) else {
                    DispatchQueue.main.async {
                        activityIndicator.stopAnimating()
                        activityIndicator.removeFromSuperview()
                        self.image = UIImage(named: "no-image")!
                    }
                    return
            }
            
            // Now we can update UI with the image, and disable de activity indicator
            DispatchQueue.main.async {
                activityIndicator.stopAnimating()
                activityIndicator.removeFromSuperview()
                self.image = image
            }
        }
    }
    
}
