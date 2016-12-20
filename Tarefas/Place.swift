//
//  File.swift
//  Tarefas
//
//  Created by Rodrigo Kreutz on 20/12/16.
//  Copyright © 2016 Rodrigo Kreutz. All rights reserved.
//

import Foundation
import CoreLocation

struct Place {
    
    let city: String
    let district: String
    let urlPhoto: String
    let urlLogo: String
    let title: String
    let phoneNumber: String
    let text: String
    let address: String
    let location: CLLocationCoordinate2D
    let comments: [Comment]
    
    init(dict: [String: Any]) {
        if let city = dict["cidade"] as? String {
            self.city = city
        } else {
            self.city = ""
        }
        
        if let district = dict["bairro"] as? String {
            self.district = district
        } else {
            self.district = ""
        }
        
        if let urlPhoto = dict["urlFoto"] as? String {
            self.urlPhoto = urlPhoto
        } else {
            self.urlPhoto = ""
        }
        
        if let urlLogo = dict["urlLogo"] as? String {
            self.urlLogo = urlLogo
        } else {
            self.urlLogo = ""
        }
        
        if let title = dict["titulo"] as? String {
            self.title = title
        } else {
            self.title = ""
        }
        
        if let phoneNumber = dict["telefone"] as? String {
            self.phoneNumber = phoneNumber
        } else {
            self.phoneNumber = ""
        }
        
        if let text = dict["texto"] as? String {
            self.text = text
        } else {
            self.text = ""
        }
        
        if let address = dict["endereco"] as? String {
            self.address = address
        } else {
            self.address = ""
        }
        
        if let latitude = dict["latitude"] as? Double, let longitude = dict["longitude"] as? Double {
            self.location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        } else {
            self.location = kCLLocationCoordinate2DInvalid
        }
        
        var tmpComments: [Comment] = []
        if let commentsJson = dict["comentarios"] as? [[String: Any]] {
            for commentDict in commentsJson {
                tmpComments.append(Comment(dict: commentDict))
            }
        }
        self.comments = tmpComments
    }
    
}
