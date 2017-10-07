//
//  View.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/09/01.
//  Copyright © 2017年 山浦功. All rights reserved.
//

import Foundation
import UIKit


//status bar　背景　黒
class statusBar: UIView{
    override init(frame: CGRect) {
        super.init(frame: frame)
        let statusBar = UIView(frame:CGRect(x: 0.0, y: 0.0, width: UIScreen.main.bounds.size.width, height: 20.0))
        statusBar.backgroundColor = UIColor.black
        self.addSubview(statusBar)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

/// 制約(NSLayoutConstraint)を生成する
/// - parameter item: 制約を追加するオブジェクト
/// - parameter attr: 制約を追加するオブジェクトに与える属性
/// - parameter to: 制約の相手
/// - parameter attrTo: 制約相手に使用する属性
/// - parameter constant: 定数値
/// - parameter multiplier: 乗数値
/// - parameter relate: 計算式の関係性
/// - parameter priority: 制約の優先度
/// - returns: 制約(NSLayoutConstraint)オブジェクト
public func Constraint(item: AnyObject, _ attr: NSLayoutAttribute, to: AnyObject?, _ attrTo: NSLayoutAttribute, constant: CGFloat = 0.0, multiplier: CGFloat = 1.0, relate: NSLayoutRelation = .equal, priority: UILayoutPriority = UILayoutPriorityRequired) -> NSLayoutConstraint {
    let ret = NSLayoutConstraint(
        item:       item,
        attribute:  attr,
        relatedBy:  relate,
        toItem:     to,
        attribute:  attrTo,
        multiplier: multiplier,
        constant:   constant
    )
    ret.priority = priority
    return ret
}

