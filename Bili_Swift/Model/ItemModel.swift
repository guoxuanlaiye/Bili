//
//  ItemModel.swift
//  Bili_Swift
//
//  Created by yingcan on 16/12/28.
//  Copyright © 2016年 Guoxuan. All rights reserved.
//

import UIKit

class RecomModel: NSObject {
    
    var param : String = ""
    var type  : String = ""
    var style : String = ""
    var title : String = ""
    
    var body  : [[String:NSObject]]? {
        didSet{
            guard let body = body else {
                return
            }
            
            for dict in body {
            
                Bodys.append(ItemModel.init(dict: dict))
            }
        
        }
    }

    //模型数组
    lazy var Bodys : [ItemModel] = [ItemModel]()
    
    init(dict:[String:NSObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
    }
}

class ItemModel: NSObject {
    
    var title:String = ""
    var cover:String = ""
    var uri:String   = ""
    var param:String = ""
    var goto:String  = ""
    
    init(dict:[String:NSObject]) {
        super.init()
        
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
}
