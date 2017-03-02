//
//  MainNavigationViewController.swift
//  Bili_Swift
//
//  Created by yingcan on 16/12/28.
//  Copyright © 2016年 Guoxuan. All rights reserved.
//

import UIKit

class MainNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if self.childViewControllers.count > 0 {
        
            let backBtn = UIButton.init(type: .custom)
            backBtn.setTitle("返回", for: .normal)
            backBtn.setTitleColor(UIColor.black, for: .normal)
            backBtn.sizeToFit()
            backBtn.addTarget(self, action: #selector(MainNavigationViewController.back), for: .touchUpInside)
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: backBtn)
            
        }
    }
    func back() {
        self.popViewController(animated: true)
    }
    
    //右滑返回手势
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return self.childViewControllers.count > 1
    }
}
