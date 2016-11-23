//
//  ReadSecFlowLayout.swift
//  OffDuty
//
//  Created by 黄志刚 on 2016/11/19.
//  Copyright © 2016年 Huangzhigang. All rights reserved.
//

import UIKit

class ReadSecFlowLayout: UICollectionViewFlowLayout {

    override init() {
        super.init()

        self.itemSize = CGSize(width: 170, height: 170)
        self.scrollDirection = .horizontal
        self.minimumLineSpacing = 8.0
        self.minimumInteritemSpacing = 8.0
//        indeinset
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    
    
    
}
