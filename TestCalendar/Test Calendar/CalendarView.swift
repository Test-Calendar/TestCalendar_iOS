//
//  CalendarView.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/09/01.
//  Copyright © 2017年 山浦功. All rights reserved.
//

//import UIKit
//import Koyomi
//
//class CalendarView: UIView{
//    
//    var aiueo: UILabel!
//    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        setKoyomi()
//    }
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//    }
//    
//    
//    func setKoyomi(){
//        let frame = CGRect(x: 0, y : 0, width: self.frame.width, height: self.frame.height)
//        let calendar = Koyomi(frame: frame, sectionSpace: 1.5, cellSpace: 0.5, inset: .zero, weekCellHeight: 25)
//        calendar.inset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
//        calendar.selectionMode = .single(style: .circle)
//        calendar.weeks = ("日", "月", "火", "水", "木", "金", "土")
//        let currentDateString = calendar.currentDateString(withFormat: "yyyy年MM月d日")
//        print(currentDateString)
//        
//        self.addSubview(calendar)
//    }
//}
