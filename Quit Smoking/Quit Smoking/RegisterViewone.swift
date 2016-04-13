//
//  RegisterViewone.swift
//  Quit Smoking
//
//  Created by Sushan Jiang on 4/12/16.
//  Copyright © 2016 Le Tang Boon. All rights reserved.
//

import UIKit
class RegisterViewone: ResponsiveTextFieldViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
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
        print(userNameRegister)
        print(userPasswordRegister)
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