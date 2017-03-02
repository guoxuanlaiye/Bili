//
//  HomeViewController.swift
//  Bili_Swift
//
//  Created by yingcan on 16/12/28.
//  Copyright © 2016年 Guoxuan. All rights reserved.
//

import UIKit
import Alamofire

fileprivate let HomeCellID   = "HomeViewCellID"
fileprivate let HomeHeaderID = "HomeHeaderViewID"
fileprivate let HomeFooterID = "HomeFooterViewID"

class HomeViewController: UIViewController{

    fileprivate lazy var dataArray : [RecomModel] = [RecomModel]()

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
        homeCollect.backgroundColor = UIColor.white
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
        //       collectionView.registerClass(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headView")
        homeCollectionView.register(UINib.init(nibName: "HomeViewCell", bundle: nil), forCellWithReuseIdentifier: HomeCellID)
        homeCollectionView.register(UINib.init(nibName: "HomeHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: HomeHeaderID)
        homeCollectionView.register(UINib.init(nibName: "HomeFooterView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: HomeFooterID)

    }
    private func setupView() {
        
        view.addSubview(homeCollectionView)
    }
    private func loadHomeRecomlistData(){
    
        GXNetworkTool.requestData(url: Home_RecomlistURL, successCallback: { (result) in
        
            guard let resultDict = result as? [String:NSObject] else {return}
            
            guard let dataSource = resultDict["data"] as? [[String:NSObject]] else {return}
            
            for dic in dataSource {
            
                let model = RecomModel(dict:dic)
                self.dataArray.append(model)
            }
            self.homeCollectionView.reloadData()
            
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
        return 1
    }
    /// MARK --- 返回分区中cell的个数
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        
        if self.dataArray.count == 0 {
            return 1
        }
        let headitme = self.dataArray[0]
        return headitme.Bodys.count
    }
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
        let homeCell  = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCellID, for: indexPath) as! HomeViewCell
        if self.dataArray.count > 0 {
            let headitme  = self.dataArray[indexPath.section]
            let body      = headitme.Bodys
            homeCell.body = body[indexPath.item]
        }
        
        return homeCell
    }
    
//    public func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        
//        if kind == UICollectionElementKindSectionHeader { //页眉
//        
//            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "HomeHeaderViewID", for: indexPath) as! HomeHeaderView
//            return headerView
//            
//        } else { //页脚
//            
//            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "HomeFooterViewID", for: indexPath) as! HomeFooterView
//            return footerView
//            
//        }
//    }
}

//extension HomeViewController:UICollectionViewDelegateFlowLayout {
//    //页眉size
//    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return CGSize.init(width: self.view.frame.size.width, height: 60)
//    }
//    //页脚size
//    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
//        return CGSize.init(width: self.view.frame.size.width, height: 60)
//    }
//}

