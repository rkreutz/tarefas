//
//  Comment.swift
//  Tarefas
//
//  Created by Rodrigo Kreutz on 20/12/16.
//  Copyright © 2016 Rodrigo Kreutz. All rights reserved.
//

import Foundation

struct Comment {
    
    let urlPhoto: String
    let name: String
    let rating: Int
    let title: String
    let description: String
    
    init(dict: [String: Any]) {
        if let urlPhoto = dict["urlFoto"] as? String {
            self.urlPhoto = urlPhoto
        } else {
            self.urlPhoto = ""
        }
        
        if let name = dict["nome"] as? String {
            self.name = name
        } else {
            self.name = ""
        }
        
        if let rating = dict["nota"] as? Int {
            self.rating = rating
        } else {
            self.rating = 0
        }
        
        if let title = dict["titulo"] as? String {
            self.title = title
        } else {
            self.title = ""
        }
        
        if let description = dict["comentario"] as? String {
            self.description = description
        } else {
            self.description = ""
        }
    }
    
}
