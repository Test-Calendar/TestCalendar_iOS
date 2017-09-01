//
//  CalendarView.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/09/01.
//  Copyright © 2017年 山浦功. All rights reserved.
//

import UIKit

class CalendarView: UIView {
    let collection:UICollectionView
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collection.frame = self.frame
    }
    
    required init(model: CalendarModel){
        collection = UICollectionView(frame: CGRect.init(x: 0, y: 0, width: self.frame.width, height: self.frame.height), collectionViewLayout: .plain)
        self.addSubview(collection)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
