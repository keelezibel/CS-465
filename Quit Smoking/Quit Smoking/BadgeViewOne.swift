//
//  BadgeViewOne.swift
//  Quit Smoking
//
//  Created by Sushan Jiang on 4/12/16.
//  Copyright © 2016 Le Tang Boon. All rights reserved.
//


import UIKit
var numBadgerecord = 2
class BadgeViewOne: ResponsiveTextFieldViewController{

    
    @IBOutlet weak var numBadges: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        numBadges.text = String(numBadgerecord)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}