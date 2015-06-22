//
//  ScavengerHuntItem.swift
//  LMScavenger_Hunt
//
//  Created by Apple on 6/20/15.
//  Copyright (c) 2015 Linnea May. All rights reserved.
//

import Foundation
import UIKit

class ScavengerHuntItem: NSObject, NSCoding {
    let name: String
    var photo: UIImage?
    var completed: Bool
    {
        get
        {
            return photo != nil
        }
    }
    
    let NameKey = "nameKey"
    let PhotoKey = "photoKey"
    
    init(name: String)
    {
        self.name = name //Needs the "self" always, even if diff parameter name
    }
    
    required init(coder aDecoder:NSCoder)
    {
        name = aDecoder.decodeObjectForKey(NameKey) as! String
        photo = aDecoder.decodeObjectForKey(PhotoKey) as? UIImage
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: NameKey)
        if let thePhoto = photo
        {
            aCoder.encodeObject(photo, forKey: PhotoKey)
        }
    }
    
    
}

