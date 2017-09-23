//
//  WatchButton.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/09/17.
//  Copyright © 2017年 山浦功. All rights reserved.
//


import UIKit


class WatchButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let width = self.frame.width
        let height = width
        self.frame = CGRect(x: 0, y: 0, width: width, height: height)
        self.layer.cornerRadius = width/2
        self.layer.masksToBounds = true
        self.titleLabel?.textAlignment = .center
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        fatalError("init(coder:) has not been implemented")
    }
}


func changeWatchButtonType(am: WatchButton , pm: WatchButton, type: watchType){

    if type == .am{
        am.titleLabel?.textColor = WatchButtonColor.enabled()
        am.backgroundColor = WatchButtonColor.selected()
        
        pm.titleLabel?.textColor = WatchButtonColor.selected()
        pm.backgroundColor = WatchButtonColor.enabled()
    }else {
        am.titleLabel?.textColor = WatchButtonColor.selected()
        am.backgroundColor = WatchButtonColor.enabled()
        
        pm.titleLabel?.textColor = WatchButtonColor.enabled()
        pm.backgroundColor = WatchButtonColor.selected()
    }
}
