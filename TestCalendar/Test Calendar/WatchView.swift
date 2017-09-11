

//
//  WatchView.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/09/11.
//  Copyright © 2017年 山浦功. All rights reserved.
//

import UIKit



class WatchView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let timeLabel = UILabel()
        timeLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        timeLabel.text = "テスト"
        self.addSubview(timeLabel)
    }
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let margin: CGFloat = 60
        let oval = UIBezierPath(ovalIn: CGRect(x: margin/2, y: margin/2, width: self.frame.width - margin, height: self.frame.height - margin))
        CalendarColor.watchBackgroundColor().setFill()
        oval.fill()
        
//        UIColor.green.setStroke()
//        oval.lineWidth = 2
//        oval.stroke()
        
        
    }
}

