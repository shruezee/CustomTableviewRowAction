//
//  CustomTableViewRowAction.swift
//  OmniSTOCK
//
//  Created by Shruthi on 26/10/2016.
//  Copyright © 2016 Omni Market Tide. All rights reserved.
//
let width:Double = 84.0 // this suits current icons
let borderWidth = CGFloat(2.0)

import UIKit
/**
 Custom TableViewRowAction
 - Required title to be some text or blankspace to adjust the width of image
 */
class TableViewRowAction: UITableViewRowAction
{
    var image: UIImage?
    
    /** For accurate results please specify in the multiples of 4.40771484375(This is space of default font size)
     */
    var contentColor = UIColor.lightTextColor()
    
    
    func _setButton(button: UIButton)
    {
        if let image = image , let titleLabel = button.titleLabel /// comment title label to hide titleLabel
        {
            button.tintColor = contentColor
            
            // calculate size
            let stringWidth = getEmptyText(width)
            button.setTitle(stringWidth, forState: .Normal)
            
            let labelString = NSString(string: stringWidth)
            let titleSize = labelString.sizeWithAttributes([NSFontAttributeName: titleLabel.font])
            
            button.imageEdgeInsets.right = -titleSize.width
            
            let customImage = UIImage.drawImagesAndText(titleLabel.text ?? "", image: image, withSize: CGSize(width: titleSize.width, height: titleSize.width) ,borderWidth:borderWidth, borderColor:contentColor.CGColor)
            button.setImage(customImage.imageWithRenderingMode(.AlwaysTemplate), forState: .Normal)
        }
    }
    

}



/**
 Get string with blanck spaces which is nearest to the number
 */
func getEmptyText(ofWt:Double) -> String {
    
    let spcaeConstant = 4.40771484375
    
    let relWt = ofWt-(ofWt%spcaeConstant)
    
    let absNum:Int = Int(relWt/spcaeConstant)
    
    var titleStr = ""
    
    for _ in 0...absNum {
        titleStr += " "
    }
    return titleStr
}


extension UIImage {
    static func drawImagesAndText(text:String, image:UIImage, withSize:CGSize, borderWidth:CGFloat, borderColor:CGColor) -> UIImage {
        // create an view with icon and image
        let view = UIView(frame: CGRect(origin: CGPointZero, size: withSize))
        view.layer.borderWidth = borderWidth
        view.layer.borderColor = borderColor
        view.contentMode = .Center
    
        let icon = UIImageView(image: image)
        icon.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height/2)
        icon.contentMode = .Bottom
        view.addSubview(icon)
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: view.frame.size.height/2, width: view.frame.size.width, height: view.frame.size.height/2))
        titleLabel.text = text
        titleLabel.textAlignment = .Center
        view.addSubview(titleLabel)
        
        // draw the view to an image
        UIGraphicsBeginImageContextWithOptions(view.frame.size, false, UIScreen.mainScreen().scale)
        view.drawViewHierarchyInRect(view.bounds, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
        
    }
}