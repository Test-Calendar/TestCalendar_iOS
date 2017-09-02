//
//  CalendarView.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/09/01.
//  Copyright © 2017年 山浦功. All rights reserved.
//

import UIKit

class CalendarView: UIView{
    
    var collection: UICollectionView!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        self.addSubview(collection)
//    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collection.frame = self.frame
    }
}
