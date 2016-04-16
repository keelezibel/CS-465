//
//  FileSaveOne.swift
//  Quit Smoking
//
//  Created by Sushan Jiang on 4/15/16.
//  Copyright © 2016 Le Tang Boon. All rights reserved.
//



import UIKit
class RegisterSaveOne: ResponsiveTextFieldViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    
    
    @IBOutlet weak var UserFnameReg: UITextField!
    
    
    @IBOutlet weak var userLnameReg: UITextField!
    
    @IBOutlet weak var UserAgeReg: UITextField!
    @IBOutlet weak var UserPwReg: UITextField!
    @IBOutlet weak var UserNameReg: UITextField!
    var Array = ["Less than 5", "5 to 10", "10 to 15", "15 to 20", "more than 20"]
    
    @IBOutlet weak var Picker1: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Picker1.delegate=self
        Picker1.dataSource=self
        
        
        let AccountFile=FileUtils(fileName: "AccountLog.csv")
        
        let returnval2 = AccountFile.readFile()
        let returnvalArr2 = returnval2.characters.split{$0 == ","}.map(String.init)
        print(returnvalArr2[0])
        print(returnvalArr2[1])
        let newStringreturnval2 = returnvalArr2[1].stringByReplacingOccurrencesOfString("\n", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        
        
        let ProfileFile=FileUtils(fileName: "ProfileLog.csv")
        let returnval = ProfileFile.readFile()
        let returnvalArr = returnval.characters.split{$0 == ","}.map(String.init)
        print(returnvalArr[0])
        print(returnvalArr[1])
        print(returnvalArr[2])
        let newStringreturnval = returnvalArr[2].stringByReplacingOccurrencesOfString("\n", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        
        UserFnameReg.text = returnvalArr[0]
        userLnameReg.text = returnvalArr[1]
        UserAgeReg.text = newStringreturnval
        UserPwReg.text = newStringreturnval2
        UserNameReg.text = returnvalArr2[0]
    }
    
    @IBAction func changeAccount(sender: AnyObject) {
        
        let logFileProfile = FileUtils(fileName: "ProfileLog.csv")
        let logFileAccount = FileUtils(fileName: "AccountLog.csv")
        logFileProfile.clearFile()
        logFileAccount.clearFile()
        print("Saving Log Data1 ...")
        let logEntryProfile = "\(UserFnameReg.text!),\(userLnameReg.text!),\(UserAgeReg.text!)\n"
        print( logEntryProfile )
        let retVal1 = logFileProfile.appendFile(logEntryProfile)
        print("Entire File: \n" )
        print(logFileProfile.readFile())
        
        print( retVal1 ?  "File Saved":
            "File Error")
        
        
        print("Saving Log Data2 ...")
        let logEntryAccount = "\(UserNameReg.text!),\(UserPwReg.text!)\n"
        print( logEntryAccount )
        let retVal2 = logFileAccount.appendFile(logEntryAccount)
        print("Entire File: \n" )
        print(logFileAccount.readFile())
        
        print( retVal2 ?  "File Saved":
            "File Error")
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