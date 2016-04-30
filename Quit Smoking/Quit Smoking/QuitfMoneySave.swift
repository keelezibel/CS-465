//
//  QuitfMoneySave.swift
//  Quit Smoking
//
//  Created by Sushan Jiang on 4/29/16.
//  Copyright © 2016 Le Tang Boon. All rights reserved.
//



import UIKit
class QuitfMoneySave: ResponsiveTextFieldViewController{
    
    @IBOutlet weak var CardNumSave: UITextField!
    @IBOutlet weak var CardFname: UITextField!
    @IBOutlet weak var CardLname: UITextField!
    @IBOutlet weak var CardExp: UITextField!
    
    
    var oricard=""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        let ProfileFile=FileUtils(fileName: "Quit4MoneyLog.csv")
        if(ProfileFile.fileExists()){
        let returnval = ProfileFile.readFile()
        let returnvalArr = returnval.characters.split{$0 == ","}.map(String.init)
        print(returnvalArr[0])
        print(returnvalArr[1])
        print(returnvalArr[2])
        let newStringreturnval = returnvalArr[3].stringByReplacingOccurrencesOfString("\n", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        oricard = returnvalArr[0]
        CardNumSave.text = returnvalArr[0]
        CardFname.text = returnvalArr[1]
        CardLname.text = returnvalArr[2]
        CardExp.text = newStringreturnval
        }
    }
    
    @IBAction func savebutton(sender: AnyObject) {
        
        if(CardNumSave.text == ""){
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
            let logEntryProfile = "\(CardNumSave.text!),\(CardFname.text!),\(CardLname.text!),\(CardExp.text!)\n"
            print( logEntryProfile )
            let retVal1 = logFileMoney.appendFile(logEntryProfile)
            print("Entire File: \n" )
            print(logFileMoney.readFile())
            
            print( retVal1 ?  "File Saved":
                "File Error")
            
            
            let alertController = UIAlertController(title: "Notice", message:
                "We have returned 149 dollars to the old card \(oricard) and taken 149 dollars from the new card \(CardNumSave.text!)", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
            
            
            
            
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}