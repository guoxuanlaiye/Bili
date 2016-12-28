//
//  HomeViewController.swift
//  Bili_Swift
//
//  Created by yingcan on 16/12/28.
//  Copyright © 2016年 Guoxuan. All rights reserved.
//

import UIKit
import Alamofire

class HomeViewController: UIViewController{

    fileprivate lazy var myLayout:UICollectionViewFlowLayout = {
    
        let layout = UICollectionViewFlowLayout()
        let spaceValue:CGFloat = 8.0
        layout.itemSize = CGSize.init(width: (ScreenW-3*spaceValue)/2, height: (ScreenW-3*spaceValue)/2)
        layout.minimumLineSpacing      = spaceValue
        layout.minimumInteritemSpacing = spaceValue
        layout.sectionInset = UIEdgeInsets(top: spaceValue, left: spaceValue, bottom: spaceValue, right: spaceValue)
        
        return layout
    }()
    
    fileprivate lazy var homeCollectionView:UICollectionView = {[weak self] in
    
        let frame = CGRect.init(x: 0, y: 0, width: ScreenW, height: ScreenH)
        
        let homeCollect = UICollectionView.init(frame: frame, collectionViewLayout:(self?.myLayout)!)
        homeCollect.backgroundColor = UIColor.orange
        homeCollect.delegate   = self
        homeCollect.dataSource = self
        
        return homeCollect
    }()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //注册cell
        registerCell()
        //设置界面
        setupView()
        //加载数据
        loadHomeRecomlistData()
    }

    private func registerCell() {
        
        homeCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    private func setupView() {
        
        view.addSubview(homeCollectionView)
    }
    private func loadHomeRecomlistData(){
    
        GXNetworkTool.requestData(url: Home_RecomlistURL, successCallback: { (result) in
        
            
        }) { (error) in
        
            
        }
    
    }
}
//MARK: - UICollectionViewDelegate
extension HomeViewController:UICollectionViewDelegate {
   
    
}
//MARK: - UICollectionViewDataSource
extension HomeViewController:UICollectionViewDataSource {

   
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int{
        return 3
    }
    /// MARK --- 返回分区中cell的个数
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return 6
    }
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = UIColor.white
        return cell;
    }

}
