//
//  ItemModel.swift
//  Bili_Swift
//
//  Created by yingcan on 16/12/28.
//  Copyright © 2016年 Guoxuan. All rights reserved.
//

import UIKit

class ItemModel: NSObject {

    var cover:String = ""
    var title:String = ""
    var play:Int     = 0
    var danmaku:Int  = 0
    var uri:String   = ""
    
    init(dict:[String:NSObject]) {
        
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }

}
