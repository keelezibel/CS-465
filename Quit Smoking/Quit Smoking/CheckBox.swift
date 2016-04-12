//
//  CheckBox.swift
//  Quit Smoking
//
//  Created by KimJu Young on 2016. 4. 10..
//  Copyright © 2016년 Le Tang Boon. All rights reserved.
//
import UIKit

class CheckBox: UIButton {
    let checkedImage = UIImage(named:"checked_checkbox")! as UIImage
    let unCheckedImage = UIImage(named:"unchecked_checkbox")! as UIImage
    
    var isChecked:Bool = false{
        didSet{
            if isChecked == true{
                self.setImage(checkedImage, forState: .Normal)
            }else{
                self.setImage(unCheckedImage, forState: .Normal)
            }
        }
    }
    
    override func awakeFromNib() {
        self.addTarget(self, action: #selector(CheckBox.buttonClicked(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.isChecked = false
    }
    
    func buttonClicked(sender:UIButton){
        if(sender == self){
            if isChecked == true{
                isChecked = false
            }else{
                isChecked = true
            }
        }
    }
    
    
}
