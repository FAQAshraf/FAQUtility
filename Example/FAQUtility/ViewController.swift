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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func buttonClicked(_ sender: Any) {
        let result = FAQUtility.isEmptyString("Hello")
        
    }

}

