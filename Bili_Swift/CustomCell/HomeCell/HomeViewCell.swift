//
//  HomeViewCell.swift
//  Bili_Swift
//
//  Created by yingcan on 16/12/28.
//  Copyright © 2016年 Guoxuan. All rights reserved.
//

import UIKit
import Kingfisher

class HomeViewCell: UICollectionViewCell {

    @IBOutlet weak var faceImageV: UIImageView!
    
    @IBOutlet weak var titleLab: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    var body : ItemModel? {
    
        didSet {
        
            let coverUrl:String = (body?.cover)!
            let url             = URL.init(string: coverUrl)
            self.faceImageV.kf.setImage(with: url)
            self.titleLab.text  = body?.title
            
            
        
        }
        
    }
    
    
}
