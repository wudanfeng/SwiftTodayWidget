//
//  ViewController.swift
//  SwiftTodayWidget
//
//  Created by DF on 16/8/12.
//  Copyright © 2016年 df. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbNumber: UILabel!
    @IBOutlet weak var txtNumber: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
    }

   
    @IBAction func btnUpdateAction(_ sender: AnyObject) {
        
        if self.txtNumber.text == nil {
            return;
        }

        
        let userDef = UserDefaults.init(suiteName: "group.com.tyjy.SwiftTodayWidget");
        userDef!.set(self.txtNumber.text, forKey: "numberValue");
        userDef?.synchronize();
        
        self.lbNumber.text = self.txtNumber.text!;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

