//
//  UIColor-Extension.swift
//  OffDuty
//
//  Created by 黄志刚 on 2016/11/17.
//  Copyright © 2016年 Huangzhigang. All rights reserved.
//

import UIKit

extension UIColor{

    convenience init(_ r: CGFloat, _ g:CGFloat, _ b: CGFloat, _ alpa: CGFloat){
    
//        self.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: alpa)
        
        let random = CGFloat(arc4random_uniform(256))
        self.init(red: random/255.0, green: random/255.0, blue: random/255.0, alpha: alpa)
    }
    
//    convenience init(_ alt: CGFloat = 1.0) {
//       
//    }
   
}
