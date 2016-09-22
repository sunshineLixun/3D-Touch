//
//  DetailViewController.swift
//  3D-Touch - Swift
//
//  Created by lx on 2016/9/22.
//  Copyright © 2016年 sunshine. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    
    var text: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "详情"
        self.automaticallyAdjustsScrollViewInsets = false
        self.textView.text = text
        
    }

   
    override var previewActionItems: [UIPreviewActionItem]{
        
        let action1 = UIPreviewAction.init(title: "喜欢", style: .default) { (UIPreviewAction, UIViewController) in
            
        }
        
        let action2 = UIPreviewAction.init(title: "收藏", style: .default) { (UIPreviewAction, UIViewController) in
            
        }
        
        let cancle = UIPreviewAction.init(title: "取消", style: .default) { (UIPreviewAction, UIViewController) in
            
        }
        
        let delete = UIPreviewAction.init(title: "删除", style: .destructive) { (UIPreviewAction, UIViewController) in
            
        }
    
        let actionGroup = UIPreviewActionGroup.init(title: "删除", style: .destructive, actions: [cancle,delete])
        
        return [action1, action2 ,actionGroup]
    }


}
