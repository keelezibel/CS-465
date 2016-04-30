//
//  QuitfMoneyDisable.swift
//  Quit Smoking
//
//  Created by Sushan Jiang on 4/30/16.
//  Copyright © 2016 Le Tang Boon. All rights reserved.
//


import UIKit
class QuitfMoneyDisable: ResponsiveTextFieldViewController{
    
    
    @IBOutlet weak var nummoney: UILabel!
    @IBOutlet weak var label: UILabel!
    var oricard=""
    var money = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let ProfileFile=FileUtils(fileName: "Quit4MoneyLog.csv")
        if(ProfileFile.fileExists()){
            let returnval = ProfileFile.readFile()
            let returnvalArr = returnval.characters.split{$0 == ","}.map(String.init)
            oricard = returnvalArr[0]
            money = "149"
        }
        label.text = oricard
        nummoney.text = money
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}