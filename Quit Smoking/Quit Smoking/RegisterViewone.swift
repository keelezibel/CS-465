//
//  RegisterViewOne.swift
//  Quit Smoking
//
//  Created by Sushan Jiang on 4/12/16.
//  Copyright © 2016 Le Tang Boon. All rights reserved.
//


import UIKit
class RegisterViewOne: ResponsiveTextFieldViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    @IBOutlet var userNameRegister: UITextField!
    @IBOutlet var userPasswordRegister: UITextField!
    
    @IBOutlet weak var userPasswordConfirm: UITextField!
    @IBOutlet weak var userFnameReg: UITextField!
    
    @IBOutlet weak var userLnameReg: UITextField!
    
    @IBOutlet weak var userAgeReg: UITextField!
    
    
    
    @IBOutlet weak var Picker1: UIPickerView!
    var Array = ["Less than 5", "5 to 10", "10 to 15", "15 to 20", "more than 20"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Picker1.delegate=self
        Picker1.dataSource=self
    }
    
    @IBAction func createAccount(sender: AnyObject) {
        accounts[userNameRegister.text!] = userPasswordRegister.text!
        //print(userNameRegister)
        //print(userPasswordRegister)
        
        
        if(userNameRegister.text == ""){
            let alertController = UIAlertController(title: "Error", message:
                "please create an username", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Try Again", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
            
        }else if(userPasswordRegister.text == ""){
            let alertController = UIAlertController(title: "Error", message:
                "please create a password", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Try Again", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
            
        }else if(userFnameReg.text == ""){
            let alertController = UIAlertController(title: "Error", message:
                "please fill in your first name", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Try Again", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }else if(userLnameReg.text == ""){
            let alertController = UIAlertController(title: "Error", message:
                "please fill in your last name", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Try Again", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
            
        }else if(userAgeReg.text == ""){
            
            let alertController = UIAlertController(title: "Error", message:
                "please fill in your age", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Try Again", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
            
        }else if(userPasswordRegister.text != userPasswordConfirm.text){
            
            let alertController = UIAlertController(title: "Error", message:
                "password is not the same", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Try Again", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }else{
        
        
        
        
        let logFileProfile = FileUtils(fileName: "ProfileLog.csv")
        let logFileAccount = FileUtils(fileName: "AccountLog.csv")
        logFileProfile.clearFile()
        logFileAccount.clearFile()
        print("Saving Log Data1 ...")
        let logEntryProfile = "\(userFnameReg.text!),\(userLnameReg.text!),\(userAgeReg.text!)\n"
        print( logEntryProfile )
        let retVal1 = logFileProfile.appendFile(logEntryProfile)
        print("Entire File: \n" )
        print(logFileProfile.readFile())
        
        print( retVal1 ?  "File Saved":
            "File Error")
        
        
        print("Saving Log Data2 ...")
        let logEntryAccount = "\(userNameRegister.text!),\(userPasswordRegister.text!)\n"
        print( logEntryAccount )
        let retVal2 = logFileAccount.appendFile(logEntryAccount)
        print("Entire File: \n" )
        print(logFileAccount.readFile())
        
        print( retVal2 ?  "File Saved":
            "File Error")
        }
        let logFileTime = FileUtils(fileName: "TimeLog.csv")
        //save first log-in time
        let currentDate = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let dateComponents = calendar.components(NSCalendarUnit.Second, fromDate: currentDate)
        let currentTime = dateComponents.second
        let logEntryTime = String(currentTime)
        let retval3 = logFileTime.appendFile(logEntryTime)
        //print(logFileTime.readFile())
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Array.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return Array[row]
    }
    
}