//
//  ProcessButton.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/09/27.
//  Copyright © 2017年 山浦功. All rights reserved.
//

import UIKit


/// オレンジ色のボタンが押された時の挙動を設定できる
protocol ProcessButtonDelegate {
    func tapped()
}


/// オレンジ色のボタンを表示することができる。
class ProcessButton: UIButton{
    
    var delegate: ProcessButtonDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.delegate?.tapped()
        self.touchStartAnimation()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        self.touchEndAnimation()
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        self.touchEndAnimation()
    }
    
    
    /// 色や影の初期設定
    internal func commonInit(){
        let width = self.frame.width
        let height = self.frame.height
        self.backgroundColor = CalendarColor.buttonColor()
        self.frame = CGRect(x: 0, y: 0, width: width, height: height)
        self.setTitleColor(.white, for: .normal)
        self.setTitle("custom Button", for: .normal)
        self.layer.shadowOffset = CGSize(width: 1, height: 1 )
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 1.0
    }
    
    /// ボタンが押された時のアニメーション
    private func touchStartAnimation(){
        UIView.animate(withDuration: 0.1, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {() -> Void in
            self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95);
            self.alpha = 0.9
        },completion: nil)
    }
    
    /// ボタンから手が離れた時のアニメーション
    private func touchEndAnimation(){
        UIView.animate(withDuration: 0.1, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {() -> Void in
            self.transform = CGAffineTransform(scaleX: 1.0, y: 1.0);
            self.alpha = 1
        },completion: nil)
    }
}
