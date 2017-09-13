

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
        
        self.backgroundColor = UIColor.clear
        let margin: CGFloat = self.frame.width * 0.1
        let padding: CGFloat = margin/2
        let labelWidth: CGFloat = 18
        let labelHeight: CGFloat = 18
        let radius: CGFloat = (self.frame.width - margin * 2 )/2
        let marginX: CGFloat = margin - padding - labelWidth * 0.5
        let marginY: CGFloat = margin - padding - labelHeight * 0.5
        let labelRadius: CGFloat = radius + padding
        
        let labelPosition = [(x: (marginX + labelRadius * (1 + 0.5)), y: (marginY + labelRadius * (1 - CGFloat(sqrt(3))/2))),
                             (x: (marginX + labelRadius * (1 + CGFloat(sqrt(3))/2)), y: (marginY + labelRadius * (1 - 0.5))),
                             (x: (marginX + labelRadius * (2)), y: (marginY + labelRadius * 1)),
                             (x: (marginX + labelRadius * (1 + CGFloat(sqrt(3))/2)), y: (marginY + labelRadius * (1 + 0.5))),
                             (x: (marginX + labelRadius * (1 + 0.5)), y: (marginY + labelRadius * (1 + CGFloat(sqrt(3))/2))),
                             (x: (marginX + labelRadius * (1)), y: (marginY + labelRadius * (2))),
                             (x: (marginX + labelRadius * (1 - 0.5)),y: (marginY + labelRadius * (1 + CGFloat(sqrt(3))/2))),
                             (x: (marginX + labelRadius * (1 - CGFloat(sqrt(3)/2))), y: (marginY + labelRadius * (1 + 0.5))),
                             (x: (marginX + labelRadius * (0)), y: (marginY + labelRadius * (1))),
                             (x: (marginX + labelRadius * (1 - CGFloat(sqrt(3))/2)), y: (marginY + labelRadius * (1 - 0.5))),
                             (x: (marginX + labelRadius * (1 - 0.5)), y: (marginY + labelRadius * (1 - CGFloat(sqrt(3)/2)))),
                             (x: (marginX + labelRadius * (1)), y: (marginY + labelRadius * (0)))]
        
        for num in 0...11{
            let timeLabel = UILabel()
            timeLabel.text = "\(num + 1)"
            timeLabel.textAlignment = .center
            timeLabel.font = UIFont.systemFont(ofSize: 16.0)
            timeLabel.frame = CGRect(x: labelPosition[num].x, y: labelPosition[num].y, width: labelWidth, height: labelHeight)

            self.addSubview(timeLabel)
        }
        
        let circle = UIView()
        circle.frame = CGRect(x: margin, y: margin, width: radius * 2, height: radius * 2)
        circle.layer.cornerRadius = radius
        circle.backgroundColor = CalendarColor.watchBackgroundColor()
        //circle.backgroundColor = UIColor.black
        circle.clipsToBounds = true
        self.addSubview(circle)
        
//        let oval = UIBezierPath(ovalIn: CGRect(x: margin/2, y: margin/2, width: self.frame.width - margin, height: self.frame.height - margin))
//        CalendarColor.watchBackgroundColor().setFill()
//        oval.fill()
//        self.addSubview(oval)

    }
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
//        let margin: CGFloat = 60
//        let padding: CGFloat = 10
//        let labelWidth: CGFloat = 20
//        let labelHeight: CGFloat = 20
//        let radius: CGFloat = self.frame.width/2
//        let marginX: CGFloat = margin - padding - labelWidth * 0.5
//        let marginY: CGFloat = margin - padding - labelHeight * 0.5
//        let labelRadius: CGFloat = radius + padding
//        let labelPosition = [(x: (marginX + labelRadius * (1 + 0.5)), y: (marginY + labelRadius * (1 - CGFloat(sqrt(3))/2))),
//                             (x: (marginX + labelRadius * (1 + CGFloat(sqrt(3))/2)), y: (marginY + labelRadius * (1 - 0.5))),
//                             (x: (marginX + labelRadius * (2)), y: (marginY + labelRadius * 1)),
//                             (x: (marginX + labelRadius * (1 + CGFloat(sqrt(3))/2)), y: (marginY + labelRadius * (1 + 0.5))),
//                             (x: (marginX + labelRadius * (1 + 0.5)), y: (marginY + labelRadius * (1 + CGFloat(sqrt(3))/2))),
//                             (x: (marginX + labelRadius * (1)), y: (marginY + labelRadius * (2))),
//                             (x: (marginX + labelRadius * (1 - 0.5)),y: (marginY + labelRadius * (1 + CGFloat(sqrt(3))/2))),
//                             (x: (marginX + labelRadius * (1 - CGFloat(sqrt(3)/2))), y: (marginY + labelRadius * (1 + 0.5))),
//                             (x: (marginX + labelRadius * (0)), y: (marginY + labelRadius * (1))),
//                             (x: (marginX + labelRadius * (1 - CGFloat(sqrt(3))/2)), y: (marginY + labelRadius * (1 - 0.5))),
//                             (x: (marginX + labelRadius * (1 - 0.5)), y: (marginY + labelRadius * (1 - CGFloat(sqrt(3)/2)))),
//                             (x: (marginX + labelRadius * (1)), y: (marginY + labelRadius * (0)))]
//        
//        for num in 0 ... 12{
//            let timeLabel = UILabel()
//            timeLabel.text = "\(num + 1)"
//            timeLabel.font = UIFont.systemFont(ofSize: 12.0)
//            timeLabel.frame = CGRect(x: labelPosition[num].x, y: labelPosition[num].y, width: 20, height: 20)
//        }
//        
//        let oval = UIBezierPath(ovalIn: CGRect(x: margin/2, y: margin/2, width: self.frame.width - margin, height: self.frame.height - margin))
//        CalendarColor.watchBackgroundColor().setFill()
//        oval.fill()
        
//        UIColor.green.setStroke()
//        oval.lineWidth = 2
//        oval.stroke()
        
        
    }
}
    
