//
//  ViewController.swift
//  Quit Smoking
//
//  Created by Le Tang Boon on 3/26/16.
//  Copyright © 2016 Le Tang Boon. All rights reserved.
//

import UIKit
var accounts:[String:String] = [:]
class ViewController: ResponsiveTextFieldViewController{
    
    @IBOutlet var userPasswordLogin: UITextField!
    @IBOutlet var userNameLogin: UITextField!
    @IBOutlet var userNameRegister: UITextField!
    @IBOutlet var userPasswordRegister: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //after registering add the account detail to a dict
        accounts[userNameRegister.text!] = userPasswordRegister.text!
        
        
    }
    
    func accountVerify() {
        for 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

