//
//  ItemsManager.swift
//  LMScavenger_Hunt
//
//  Created by Apple on 6/20/15.
//  Copyright (c) 2015 Linnea May. All rights reserved.
//

import Foundation

class ItemsManager
{
    var items = [ScavengerHuntItem]()
    lazy private var archivePath: String =
    {
        let fileManager = NSFileManager.defaultManager()
        let documentsDirectoryURLs = fileManager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask) as! [NSURL]
        let archiveURL = documentsDirectoryURLs.first!.URLByAppendingPathComponent("ScavengerHuntItems", isDirectory: false)
        return archiveURL.path!
    }()
    
    func save()
    {
        NSKeyedArchiver.archiveRootObject(items, toFile: archivePath)
    }
    
    private func unarchiveSavedItems()
    {
       if NSFileManager.defaultManager().fileExistsAtPath(archivePath)
       {
            let savedItems = NSKeyedUnarchiver.unarchiveObjectWithFile(archivePath) as! [ScavengerHuntItem]
            items += savedItems
        }
    }
    
    init()
    {
        unarchiveSavedItems()
    }
}