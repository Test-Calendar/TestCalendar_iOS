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
        let radius: CGFloat = (min(self.frame.width, self.frame.height) - margin * 2 )/2
        let marginX: CGFloat = margin - padding - labelWidth * 0.5
        let marginY: CGFloat = margin - padding - labelHeight * 0.5
        let labelRadius: CGFloat = radius + padding
        let circle = UIView()
        
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
        
        circle.frame = CGRect(x: margin, y: margin, width: radius * 2, height: radius * 2)
        circle.layer.cornerRadius = radius
        circle.backgroundColor = CalendarColor.watchBackgroundColor()
        circle.clipsToBounds = true
        self.addSubview(circle)
        self.sendSubview(toBack: circle)
    }
    
    
//    override func bringSubview(toFront view: UIView) {
//        view.frame = CGRect(x: self.frame.width/2, y: self.frame.height/2, width: 200, height: 200)
//        view.backgroundColor = UIColor.white
//        self.addSubview(view)
//        super.bringSubview(toFront: view)
//    }
    
    
    func addSubject(){//start: Date, end: Date, color: String
//        let view = UIView()
//        view.frame = CGRect(x: self.frame.width/2, y: self.frame.height/2, width: 200, height: 200)
//        view.backgroundColor = UIColor.white
//        self.addSubview(view)
//        super.bringSubview(toFront: view)
        let start = Date()
        let end = Date()
        let startInt = start.timeIntervalSince1970
        let endInt = end.timeIntervalSince1970
        
        
        let subject = SubjectView()
        subject.frame = self.frame
        subject.subjects = [Subject(color: CalendarColor.blue(), start: 12, end: 12)]
        self.addSubview(subject)
    }
}


struct Subject {
    var color: UIColor
    var start: CGFloat
    var end:   CGFloat
}


class SubjectView: UIView {
    
    var subjects = [Subject]() {
        didSet {
            setNeedsDisplay() // re-draw view when the values get set 
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        isOpaque = false // when overriding drawRect, you must specify this to maintain transparency.
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        let margin: CGFloat = self.frame.width * 0.1
        let ctx = UIGraphicsGetCurrentContext()
        let radius: CGFloat = (min(self.frame.width, self.frame.height) - margin * 2 )/2
        let center = CGPoint(x: bounds.size.width * 0.5, y: bounds.size.height * 0.5)
        let zero = -CGFloat.pi * 0.5
        for subject in subjects {
            let startAngle = zero - 2 * .pi * (subject.start)
            let endAngle = zero + 2 * .pi * (subject.end)
            ctx?.setFillColor(subject.color.cgColor)
            ctx?.move(to: center)
            ctx?.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
            ctx?.fillPath()
        }
    }
}


func timeToInt(hour: String) -> Int{
    switch hour{
    case "1" : return 1
    case "2" : return 2
    case "3" : return 3
    case "4" : return 4
    case "5" : return 5
    case "6" : return 6
    case "7" : return 7
    case "8" : return 8
    case "9" : return 9
    case "10": return 10
    case "11": return 11
    case "12": return 12
    default: return 0
    }
}
