//
//  GXNetworkTool.swift
//  Bili_Swift
//
//  Created by yingcan on 16/12/28.
//  Copyright © 2016年 Guoxuan. All rights reserved.
//

import UIKit
import Alamofire

class GXNetworkTool: NSObject {

    //GET
    class func requestData(url:String,successCallback success:@escaping(_ result:Any)->(),failureCallback failure:@escaping(_ error:Any)->()) {
    
        Alamofire.request(url).responseJSON { (response) in
            
            if response.result.value != nil {
            
                success(response.result.value!)
            } else {
            
                failure(response.result.error!)
            }
        }
    
    }
    
    //POST
    class func requestData(url:String,paramsDict:Parameters,successCallback:@escaping(_ result:Any)->(),failureCallback:@escaping(_ result:Any)->()) {
    
        Alamofire.request(url, method: .post, parameters: paramsDict, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            
            if response.result.value != nil {
            
                successCallback(response.result.value!)
            
            }
        }
    }
    
}
