//
//  Button.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/09/23.
//  Copyright © 2017年 山浦功. All rights reserved.
//

import Foundation
import MaterialComponents
import UIKit



/// 「+」ボタンが押された時のコールバック関数
protocol AddButtonDelegate {
    func tapped(type: Bool) //call when button tapped
}

/// 「+」ボタン
class AddButton: MDCFloatingButton{
    
    var type = true
    var delegate: AddButtonDelegate?
    
    override init(frame: CGRect, shape: MDCFloatingButtonShape) {// コードで呼び出された時
        super.init(frame: frame, shape: shape)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    internal func setup(){
        self.setTitle("+", for: .normal)
        self.sizeToFit()
        self.addTarget(self, action: #selector(AddButton.tapped(sender:)), for: .touchUpInside)
        self.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(20))
        self.titleLabel?.textColor = .white
        self.backgroundColor = CalendarColor.black()
    }
    
    /// ボタンが押された時の関数
    ///
    /// - Parameter sender: Anything is ok 
    func tapped(sender: Any){
        self.delegate?.tapped(type: type)
    }
}





/// テスト、TODOが押された時のコールバック関数
protocol AddSmallDelegate {
    func tapped(tag: Int) //call when button tapped
}


/// テスト、TODOボタン
class AddSmallButton: MDCFloatingButton{
    
    var buttontag = Int()
    var delegate: AddSmallDelegate?
    var name = String()
    
    override init(frame: CGRect, shape: MDCFloatingButtonShape) {// コードで呼び出された時
        super.init(frame: frame, shape: shape)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    internal func setup(){
        self.setTitle(name, for: .normal)
        self.sizeToFit()
        self.addTarget(self, action: #selector(AddSmallButton.smallTapped(sender:)), for: .touchUpInside)
        self.titleLabel?.adjustsFontSizeToFitWidth = true
    }
    
    /// ボタンが押された時に呼ばれる関数
    ///
    /// - Parameter sender: Anything is ok
    func smallTapped(sender: Any){
        self.delegate?.tapped(tag: buttontag)
    }
}
