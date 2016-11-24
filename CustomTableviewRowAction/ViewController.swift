//
//  ViewController.swift
//  CustomTableviewRowAction
//
//  Created by shruthi palchandar on 24/11/2016.
//  Copyright © 2016 Shruezee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDataSource,UITableViewDelegate {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") 
        
        cell?.textLabel?.text = "some cell \(indexPath.row)"
        cell?.detailTextLabel?.text = "Swipe for more >"
        
        return cell!
    }
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        
        let more = TableViewRowAction(style: .Normal, title: "More") { action, index in
            print("more button tapped")
//            self.delegate?.onSwipeAction() /// Set up your action Here
        }
        more.backgroundColor = UIColor.yellowColor()
        more.image = UIImage(named: "more-icon")
        //        more.contentColor = ThemeColour().redColour
        
        let remove = TableViewRowAction(style: .Normal, title: "Remove") { action, index in
            print("remove button tapped")
//            self.delegate?.onSwipeAction(indexPath, actionType: SwipeActionType.Remove) /// Set up your action Here
        }
        remove.backgroundColor = UIColor.purpleColor()
        remove.image = UIImage(named: "trash-icon")
        //        remove.contentColor = ThemeColour().yellowColour
        
        return [more, remove]
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // the cells you would like the actions to appear needs to be editable
        return true
    }
}