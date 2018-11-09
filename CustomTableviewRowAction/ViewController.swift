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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") 
        
        cell?.textLabel?.text = "some cell \(indexPath.row)"
        cell?.detailTextLabel?.text = "Swipe for more >"
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let more = TableViewRowAction(style: .normal, title: "XS") { action, index in
            print("more button tapped")
//            self.delegate?.onSwipeAction() /// Set up your action Here
        }
        more.backgroundColor = UIColor.red
        more.image = UIImage(named: "more-icon")
        
        let remove = TableViewRowAction(style: .normal, title: "Big custom title") { action, index in
            print("remove button tapped")
//            self.delegate?.onSwipeAction(indexPath, actionType: SwipeActionType.Remove) /// Set up your action Here
        }
        remove.backgroundColor = UIColor.purple
        remove.image = UIImage(named: "trash-icon")
        
        return [more, remove]
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // the cells you would like the actions to appear needs to be editable
        return true
    }
}
