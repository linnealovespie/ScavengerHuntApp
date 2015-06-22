//
//  AddViewController.swift
//  LMScavenger_Hunt
//
//  Created by Apple on 6/20/15.
//  Copyright (c) 2015 Linnea May. All rights reserved.
//

import UIKit

class AddViewController: UIViewController
{

    @IBOutlet weak var textField: UITextField!
    var newItem: ScavengerHuntItem?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func cancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "DoneItem" //the right idenfifier
        {
            if let name = textField.text //if the text field is actually initialized
            {
                if !name.isEmpty //text field isn't empty
                {
                    newItem = ScavengerHuntItem(name: name)
                }
            }
        }
    }
}
