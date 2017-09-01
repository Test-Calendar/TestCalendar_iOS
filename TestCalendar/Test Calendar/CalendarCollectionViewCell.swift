//
//  CalendarCollectionViewCell.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/09/01.
//  Copyright © 2017年 山浦功. All rights reserved.
//

import UIKit

class CalendarCollectionViewCell: UICollectionViewCell {
    
    var dayLabel: UILabel?
//    var testView: [UIView] = ()
//    var studyView: [UIView] = ()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
//    func addLab
}


//日付
class DayLabel: UILabel {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.commonInit()
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    func commonInit(){
//        self.layer.cornerRadius = self.bounds.width/2
        self.clipsToBounds = true
        self.textColor = UIColor.black
//        self.setProperties(borderWidth: 1.0, borderColor:UIColor.black)
    }
    
//    func setProperties(borderWidth: Float, borderColor: UIColor) {
//        self.layer.borderWidth = CGFloat(borderWidth)
//        self.layer.borderColor = borderColor.cgColor
//    }
}


class TestLabel: UILabel{
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func commonInit(){
//        self.layer.cornerRadius = self.bounds.width/2
        self.clipsToBounds = true
//        self.setProperties(borderWidth: 1.0, borderColor: UIColor.black)
    }
    
    func setProperties(borderWidth: Float, borderColor: UIColor) {
        self.layer.borderWidth = CGFloat(borderWidth)
        self.layer.borderColor = borderColor.cgColor
    }
}


class EventLabel: UILabel{
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    func commonInit(){
        self.layer.cornerRadius = self.bounds.width/2
        self.clipsToBounds = true
        self.textColor = UIColor.black
        self.backgroundColor = 
        self.setProperties(borderWidth: 1.0, borderColor:UIColor.black)
    }
    
    func setProperties(borderWidth: Float, borderColor: UIColor) {
        self.layer.borderWidth = CGFloat(borderWidth)
        self.layer.borderColor = borderColor.cgColor
    }
}






