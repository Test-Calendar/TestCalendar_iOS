//
//  CalendarCollectionViewCell.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/09/01.
//  Copyright © 2017年 山浦功. All rights reserved.
//

import UIKit

class CalendarCell: UICollectionViewCell {
    
    var dayLabel : DayLabel!
    var tests = [TestLabel]()
    var studys = [StudyLabel]()
    var task = TaskLabel()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
//    convenience init(title:Sti)
//    func setLabels(){
//        self.day.frame = CGRect(x: 0, y: 0, width: self.bounds.width*0.46 , height: self.bounds.height*0.23)
//    }
}









