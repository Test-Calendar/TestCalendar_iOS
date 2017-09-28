//
//  BottomButton.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/09/27.
//  Copyright © 2017年 山浦功. All rights reserved.
//

import UIKit
import MaterialComponents


/// ボタンが押された時の処理をdelegateを持っているクラスで編集できる
protocol BottomButtonDelegate {
    func tapped()
}


///画面下のオレンジ色のボタン
class BottomButton: MDCFloatingButton {
    
    var delegate: BottomButtonDelegate?
    
    override init(frame: CGRect, shape: MDCFloatingButtonShape) {
        super.init(frame: frame, shape: shape)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    /// ボタンの初期化
    internal func commonInit(){
        let floatingButton = MDCFloatingButton()
        floatingButton.backgroundColor = CalendarColor.buttonColor()
        floatingButton.setTitleColor(.white, for: .normal)
        floatingButton.sizeToFit()
        let width = self.frame.width * 0.66
        let height = 42 as CGFloat
        let minY = min(self.frame.height * 0.9, self.frame.height - height * 1.5)
        floatingButton.frame = CGRect(x: 0, y: minY + 10, width: width, height: height)
        floatingButton.addTarget(self, action: Selector(("tap:")), for: .touchUpInside)
        self.addSubview(floatingButton)
    }
    
    func tap(){
        self.delegate?.tapped()
    }
}
