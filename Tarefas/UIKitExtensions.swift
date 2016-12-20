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
