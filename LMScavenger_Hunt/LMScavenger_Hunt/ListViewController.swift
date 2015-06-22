//
//  ListViewController.swift
//  LMScavenger_Hunt
//
//  Created by Apple on 6/20/15.
//  Copyright (c) 2015 Linnea May. All rights reserved.
//

import Foundation
import UIKit //library of tableViews, etc for UI

class ListViewController:UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    let myItemManager = ItemsManager()
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return myItemManager.items.count
    }
   
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("ListViewCell", forIndexPath: indexPath) as! UITableViewCell
        let temp = myItemManager.items[indexPath.row]
        cell.textLabel?.text = temp.name
        
        if temp.completed
        {
            cell.accessoryType = .Checkmark
            cell.imageView?.image = temp.photo
        }
        else{
            cell.accessoryType = .None
            cell.imageView?.image = nil
        }
        return cell
    }

    @IBAction func unwindToList(segue: UIStoryboardSegue)
    {
        if segue.identifier == "DoneItem"
        {
            let addItemController = segue.sourceViewController as! AddViewController
            if let newItem = addItemController.newItem
            {
                myItemManager.items.append(newItem)
                myItemManager.save()
                let indexPath = NSIndexPath(forRow: myItemManager.items.count - 1, inSection: 0)
                tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            }
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        let imagePicker = UIImagePickerController()
        
        if UIImagePickerController.isSourceTypeAvailable(.Camera)
        {
            imagePicker.sourceType = .Camera
        }
        else
        {
            imagePicker.sourceType = .PhotoLibrary
        }
        imagePicker.delegate = self
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject])
    {
        if let indexPath = tableView.indexPathForSelectedRow()
        {
            let selectedItem = myItemManager.items[indexPath.row]
            let photo = info[UIImagePickerControllerOriginalImage] as!UIImage
            selectedItem.photo = photo
            myItemManager.save()
            dismissViewControllerAnimated(true, completion: { () -> Void in
                self.tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            })
        }
    }

}
