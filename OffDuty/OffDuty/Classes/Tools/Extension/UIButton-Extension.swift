//
//  UIButton-Extension.swift
//  OffDuty
//
//  Created by 黄志刚 on 2016/11/18.
//  Copyright © 2016年 Huangzhigang. All rights reserved.
//

import UIKit

extension UIButton{
    
    /*
     UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(0,0,30, 30)];
     [button setTitle:text forState:UIControlStateNormal];
     [button setTitleColor:[UIColor halfWhiteColor] forState:UIControlStateHighlighted];
     button.titleLabel.font = [UIFont systemFontOfSize:15];
     button.imageEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 5);
     return button;
     */
    
    
    
    convenience init(frame: CGRect, normal: String? = "", select:String? = "") {
        
        self.init()
        self.setImage(UIImage(named:"normal"), for: .normal)
        self.setImage(UIImage(named:"select"), for: .selected)
        self.frame = frame
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: -5, bottom: 0, right: 5)
    }
    
    
    
}
