//
//  TodayViewController.swift
//  SwiftTodayWidgetExtension
//
//  Created by DF on 16/8/12.
//  Copyright © 2016年 df. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
        
    @IBOutlet weak var lbNumber: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        //设置展开与收缩
        self.extensionContext?.widgetLargestAvailableDisplayMode = NCWidgetDisplayMode.expanded;
        self.preferredContentSize = CGSize(width: UIScreen.main.bounds.width, height: 100);
        
        //获取共享值
        let userDef = UserDefaults.init(suiteName: "group.com.tyjy.SwiftTodayWidget");
        self.lbNumber.text = String(userDef!.value(forKey: "numberValue")!);
        userDef?.synchronize();
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdate(completionHandler: ((NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
    func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
        
        if activeDisplayMode == NCWidgetDisplayMode.compact {
            self.preferredContentSize = CGSize(width: UIScreen.main.bounds.width, height: 100);
        }else{
            self.preferredContentSize = CGSize(width: UIScreen.main.bounds.width, height: 200);
        }
        
    }

    
}
