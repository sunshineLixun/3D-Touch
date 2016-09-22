//
//  ViewController.swift
//  3D-Touch - Swift
//
//  Created by lx on 2016/9/22.
//  Copyright © 2016年 sunshine. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UIViewControllerPreviewingDelegate {
    @IBOutlet weak var tableView: UITableView!
    var titleArray = ["3D-Touch Objective-C","3D-Touch Swift","前言快报:Swift终将超越OC,进而取代OC","Github9月编程语言 JS 跃居第一位"]
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.title = "3D Touch - Peek & Pop 示例"
        self.automaticallyAdjustsScrollViewInsets = false
        self.tableView.rowHeight = 55
        self.tableView.tableFooterView = UIView.init()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        
        if traitCollection.forceTouchCapability == .available{
            registerForPreviewing(with: self, sourceView: tableView)
        }
        
    }

 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        cell.selectionStyle = .none
        cell.textLabel?.text = titleArray[indexPath.row]
        return cell
    }
    
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {

        guard let indexPath = tableView.indexPathForRow(at:location) , let cell = tableView.cellForRow(at: indexPath) else {
            return nil
        }
        let detailVC  = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "detail") as! DetailViewController
        previewingContext.sourceRect = cell.frame
        detailVC.text = (cell.textLabel?.text)!
        return detailVC
        
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
//        self.show(viewControllerToCommit, sender: self)
        self.navigationController?.pushViewController(viewControllerToCommit, animated: true)
    }
    
}

