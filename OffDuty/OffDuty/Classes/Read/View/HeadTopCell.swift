//
//  HeadTopCell.swift
//  OffDuty
//
//  Created by 黄志刚 on 2016/11/23.
//  Copyright © 2016年 Huangzhigang. All rights reserved.
//

import UIKit

class HeadTopCell: UICollectionViewCell {

    @IBOutlet weak var headImageView: UIImageView!
    @IBOutlet weak var headLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        headLabel.textColor = UIColor.cyan
        headImageView.image = UIImage(named:"PlaceholderRect")
        
    }

}
