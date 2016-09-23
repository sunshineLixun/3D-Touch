//
//  TodayViewController.swift
//  3D-TouchTodayExtenstion
//
//  Created by lx on 2016/9/23.
//  Copyright © 2016年 sunshine. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
        
    @IBOutlet weak var widgetLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
      
        widgetLabel.addGestureRecognizer(UITapGestureRecognizer.init(target: self
            , action: #selector(TodayViewController.widgetLabelAction)))
        
        
    }
    
  @objc private  func widgetLabelAction() -> Void {
        extensionContext?.open(NSURL(string: "simple://finished") as! URL, completionHandler: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func widgetPerformUpdate(completionHandler: ((NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
}
