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
    
    @IBAction func createAccount(sender: AnyObject) {
        accounts[userNameRegister.text!] = userPasswordRegister.text!
        print(userNameRegister)
        print(userPasswordRegister)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

class MainUI:UIViewController{
    
    var menuView: BTNavigationDropdownMenu!
    override func viewDidLoad() {
        super.viewDidLoad()
        let items = ["Settings", "Daily Reminder", "Modify Profile", "Badges", "Change Quit 4 Money Plan", "Product Info"]
        self.navigationController?.navigationBar.translucent = true
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.0/255.0, green:180/255.0, blue:220/255.0, alpha: 1.0)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        menuView = BTNavigationDropdownMenu(navigationController: self.navigationController, title: items.first!, items: items)
        menuView.cellHeight = 50
        menuView.cellBackgroundColor = self.navigationController?.navigationBar.barTintColor
        menuView.cellSelectionColor = UIColor(red: 0.0/255.0, green:160.0/255.0, blue:195.0/255.0, alpha: 1.0)
        menuView.cellTextLabelColor = UIColor.whiteColor()
        menuView.cellTextLabelFont = UIFont(name: "Avenir-Heavy", size: 17)
        menuView.cellTextLabelAlignment = .Center 
        menuView.arrowPadding = 15
        menuView.animationDuration = 0.5
        menuView.maskBackgroundColor = UIColor.blackColor()
        menuView.maskBackgroundOpacity = 0.3
        menuView.didSelectItemAtIndexHandler = {(indexPath: Int) -> () in
            if (indexPath == 2){
<<<<<<< HEAD
                let vc : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("Profile")
                self.showViewController(vc as! UIViewController, sender: vc)
               
            }
            if (indexPath == 3){
                let vc : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("Badges")
                self.showViewController(vc as! UIViewController, sender: vc)
               
=======
                let vc : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("Register")
                self.showViewController(vc as! UIViewController, sender: vc)
//                self.tabBarController!.tabBar.hidden = true
//                self.menuView.hide()
                self.view.frame.origin.y += 300;
                
                

                //self.performSegueWithIdentifier("modifyprof", sender: vc )
>>>>>>> d2206b29c36adde547b31840fcc808cc02a959a8
            }

        }
        self.navigationItem.titleView = menuView
    }
    
}

class MainUISegue:UIStoryboardSegue{
    
    
    
}







