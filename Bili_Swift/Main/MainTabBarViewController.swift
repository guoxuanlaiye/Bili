//
//  MainTabBarViewController.swift
//  Bili_Swift
//
//  Created by yingcan on 16/12/28.
//  Copyright © 2016年 Guoxuan. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let homeVC      = HomeViewController()
        homeVC.view.backgroundColor = UIColor.orange
        addChildVC(childVC: homeVC, title: "首页", normalImage: "", selectImage: "")
        
        let partitionVC = PartitionViewController()
        partitionVC.view.backgroundColor = UIColor.red
        addChildVC(childVC: partitionVC, title: "分区", normalImage: "", selectImage: "")
        
        let discoverVC  = DiscoverViewController()
        discoverVC.view.backgroundColor = UIColor.green
        addChildVC(childVC: discoverVC, title: "发现", normalImage: "", selectImage: "")
        
        let profileVC   = ProfileViewController()
        profileVC.view.backgroundColor = UIColor.blue
        addChildVC(childVC: profileVC, title: "我的", normalImage: "", selectImage: "")
        
    }
    
    private func addChildVC(childVC:UIViewController,title:String,normalImage:String,selectImage:String) {
        
        let nav = UINavigationController.init(rootViewController: childVC)
        
        nav.tabBarItem = UITabBarItem.init(title: title, image: UIImage.init(named: normalImage), selectedImage: UIImage.init(named: selectImage))
        
        addChildViewController(nav)
    
    }
}
