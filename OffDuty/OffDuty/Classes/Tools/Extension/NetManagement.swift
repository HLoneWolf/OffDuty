//
//  NetManagement.swift
//  DouYuZB
//
//  Created by 黄志刚 on 16/10/6.
//  Copyright © 2016年 Huangzhigang. All rights reserved.
//

import UIKit

import Alamofire


enum MethodType {
    case get
    case post
}


class NetManagement: NSObject {
    class func requestData(_ type : MethodType, URLString : String, parameters : [String : NSString]? = nil, finishedCallback : @escaping (_ result : AnyObject) -> ()) {
        
        
        switch type {
            
        case .get:
            
            Alamofire.request(URLString).responseJSON(completionHandler: { (response) in
                
                // 获取结果
                guard let result = response.result.value else {
                    print(response.result.error)
                    return
                }
                // 将结果回调出去
                finishedCallback(result as AnyObject)
                
            })
            
            
        case .post:
            
            Alamofire.request(URLString, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON(completionHandler: { (response) in
                // 获取结果
                guard let result = response.result.value else {
                    print(response.result.error)
                    return
                }
                
                // 将结果回调出去
                finishedCallback(result as AnyObject)
            })
            
        }
        
        
    }
}
