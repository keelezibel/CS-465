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
    
    @IBAction func loginButton(sender: AnyObject) {
        if(accounts[userNameLogin.text!] != userPasswordLogin.text!){
            let alertController = UIAlertController(title: "Error", message:
                    "Your username and password don't match!", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "Try Again", style: UIAlertActionStyle.Default,handler: nil))
                
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    }
    @IBOutlet var userPasswordLogin: UITextField!
    @IBOutlet var userNameLogin: UITextField!
    @IBOutlet var userNameRegister: UITextField!
    @IBOutlet var userPasswordRegister: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func userCreateAccount(sender: AnyObject) {
        //when you create account, save data to dictionary
        accounts[userNameRegister.text!] = userPasswordRegister.text!
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

