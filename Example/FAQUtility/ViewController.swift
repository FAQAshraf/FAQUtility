//
//  ViewController.swift
//  FAQUtility
//
//  Created by FAQ_Ashraf on 01/17/2018.
//  Copyright (c) 2018 FAQ_Ashraf. All rights reserved.
//

import UIKit
import FAQUtility

class ViewController: UIViewController {

    @IBOutlet weak var ipTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonClicked(_ sender: Any) {
        //let result = FAQUtility.isEmptyString("Hello")
        let result1 = FAQUtility.getDate(FromUTC: ipTextField.text!)
        let result = FAQUtility.getDateString(FromDate: result1, inFormat: "MMM d yyyy, h:mm a")
        print(result)
    }

}

