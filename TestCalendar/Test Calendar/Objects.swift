//
//  Objects.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/09/02.
//  Copyright © 2017年 山浦功. All rights reserved.
//

import UIKit


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
        self.clipsToBounds = true
        self.textColor = UIColor.black
    }
}


class TestLabel: UILabel{
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    func commonInit(){
        self.clipsToBounds = true
        self.setProperties(borderWidth: 1.0, borderColor: UIColor.black)
    }
    
    func setProperties(borderWidth: Float, borderColor: UIColor) {
        self.layer.borderWidth = CGFloat(borderWidth)
        self.layer.borderColor = borderColor.cgColor
    }
}


class StudyLabel: UILabel{
    
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
        self.backgroundColor = UIColor.blue
        //        self.setProperties(borderWidth: 1.0, borderColor:UIColor.black)
    }
    
    func setProperties(borderWidth: Float, borderColor: UIColor) {
        self.layer.borderWidth = CGFloat(borderWidth)
        self.layer.borderColor = borderColor.cgColor
    }
}

class TaskLabel: UILabel{
    
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
        self.backgroundColor = UIColor.black
        //        self.setProperties(borderWidth: 1.0, borderColor:UIColor.black)
    }
    
    func setProperties(borderWidth: Float, borderColor: UIColor) {
        self.layer.borderWidth = CGFloat(borderWidth)
        self.layer.borderColor = borderColor.cgColor
    }
}
