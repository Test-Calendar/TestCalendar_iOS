//
//  WatchView.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/09/11.
//  Copyright © 2017年 山浦功. All rights reserved.
//

import UIKit


enum watchType: Int{
    case am, pm
}

struct WatchEvent {
    var color: UIColor
    var start: NSDate
    var end:   NSDate
}


class WatchView: UIView {
    
    var type = watchType.pm
    let amView = SubjectView()
    let pmView = SubjectView()
    var amEvents = [WatchEvent]()
    var pmEvents = [WatchEvent]()
    
    
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
}



extension WatchView{
    
    func addSchedule(events: [WatchEvent]){//start: Date, end: Date, color: String
        //ここから下をsubjectsに追加していく for文で
        for i in events {
            if type == .am{
                amEvents.append(WatchEvent(color: i.color, start: getAngle(date: i.), end: <#T##CGFloat#>)
            }
        }
        let start = NSDate()
        let end = NSDate()
        let  dateFormatter = DateFormatter()
        dateFormatter.setTemplate(.onlyHour)
        let startAngle = getAngle(date: start)
        let endAngle = getAngle(date: end)
        
        amView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        pmView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        amView.viewWithTag(watchType.am.rawValue)
        pmView.viewWithTag(watchType.pm.rawValue)
        
        let subject = SubjectView()
        subject.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        //        subject.subjects = [Subject(color: CalendarColor.blue(), start: startTime, end: endTime)]
        subject.subjects = [WatchEvent(color: CalendarColor.redColor(), start: 30, end: 180)]
        self.addSubview(subject)
    }
    
    func changeAmPm(){
        if type == watchType.pm{
            type = watchType.am
            pmView.removeFromSuperview()
            self.addSubview(amView)
        }
        if type == watchType.am{
            type = watchType.pm
            amView.removeFromSuperview()
            self.addSubview(pmView)
        }
    }
    
    
    func getAngle(date: NSDate) -> CGFloat{
        let  dateFormatter = DateFormatter()
        dateFormatter.setTemplate(.onlyHour)
        var retTime: CGFloat!
        
        for i in 0...23{
            if dateFormatter.string(from: date as Date) == "\(i+1)"{
                if i > 11 {
                    retTime = CGFloat(Double(i) - 11.0) * 30.0
                    break
                } else {
                    retTime = CGFloat(Double(i) + 1.0) * 30.0
                    break
                }
            }
        }
        return retTime
    }
}


class SubjectView: UIView {
    
    var subjects = [WatchEvent]() {
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
        let radius: CGFloat = (min(self.frame.width, self.frame.height) - margin * 2 )/2
        let ctx = UIGraphicsGetCurrentContext()
        let center = CGPoint(x: bounds.size.width * 0.5, y: bounds.size.height * 0.5)
//        let zero = -CGFloat.pi * 0.5
        
        for subject in subjects {
            let startAngle = (subject.start - 90) * CGFloat.pi / 180
            let endAngle = (subject.end - 90) * CGFloat.pi / 180
            ctx?.setFillColor(subject.color.cgColor)
            ctx?.move(to: center)
            ctx?.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
            ctx?.fillPath()
        }
    }
}