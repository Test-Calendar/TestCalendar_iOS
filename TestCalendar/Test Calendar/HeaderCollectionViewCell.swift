//
//  HeaderCollectionViewCell.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/10/30.
//  Copyright © 2017年 山浦功. All rights reserved.
//

import UIKit

@IBDesignable class HeaderCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var dayLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
