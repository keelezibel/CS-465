//
//  QuitfMoneyReg.swift
//  Quit Smoking
//
//  Created by Sushan Jiang on 4/29/16.
//  Copyright © 2016 Le Tang Boon. All rights reserved.
//


import UIKit
class QuitfMoneyReg: ResponsiveTextFieldViewController{
    
    
    @IBOutlet weak var CardNum: UITextField!
    
    @IBOutlet weak var CardFname: UITextField!
    @IBOutlet weak var CardLname: UITextField!
    
    @IBOutlet weak var CardExp: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    
    @IBAction func SaveQuit(sender: AnyObject) {
        if(CardNum.text == ""){
            let alertController = UIAlertController(title: "Error", message:
                "please enter your card number", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Try Again", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
            
        }else if(CardFname.text == ""){
            let alertController = UIAlertController(title: "Error", message:
                "please enter card holder's first name", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Try Again", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
            
        }else if(CardLname.text == ""){
            let alertController = UIAlertController(title: "Error", message:
                "please enter card holder's last name", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Try Again", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }else if(CardExp.text == ""){
            let alertController = UIAlertController(title: "Error", message:
                "please enter card's expiration date", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Try Again", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
            
        }else{
            
            
            
            
            let logFileMoney = FileUtils(fileName: "Quit4MoneyLog.csv")
            logFileMoney.clearFile()
            print("Saving Log Data1 ...")
            let logEntryProfile = "\(CardNum.text!),\(CardFname.text!),\(CardLname.text!),\(CardExp.text!)\n"
            print( logEntryProfile )
            let retVal1 = logFileMoney.appendFile(logEntryProfile)
            print("Entire File: \n" )
            print(logFileMoney.readFile())
            
            print( retVal1 ?  "File Saved":
                "File Error")
            
            let confirmClosure: ((UIAlertAction!) -> Void)! = { action in
                print("confirm was tapped")
            }
            let alertController = UIAlertController(title: "Notice", message:
                "We have taken 150 dollars from the card \(CardNum.text!)", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.Default,handler:{
                action in
                //self.presentViewController(alertController, animated: true, completion: nil)
                let log_screen : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("Login")
                self.showViewController(log_screen as! UIViewController, sender: log_screen)
            }))
            self.presentViewController(alertController, animated: true, completion: nil)
            
            
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}