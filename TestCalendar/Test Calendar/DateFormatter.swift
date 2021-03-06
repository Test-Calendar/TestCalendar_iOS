//
//  DateFormatter.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/09/15.
//  Copyright © 2017年 山浦功. All rights reserved.
//

import UIKit

extension DateFormatter {
    
    enum Template: String {
        case date = "yMd"     // 2017/1/1
        case time = "Hm"     // 12:39
        case full = "yMdkHm" // 2017/1/1 12:39
        case onlyHour = "k"   // 17時
        case era = "GG"       // "西暦" (default) or "平成" (本体設定で和暦を指定している場合)
//        case weekDay = "EEEE" // 日曜日
    }
    
    func setTemplate(_ template: Template) {
        // optionsは拡張のためにあるが使用されていない引数
        // localeは省略できないがほとんどの場合currentを指定する
        dateFormat = DateFormatter.dateFormat(fromTemplate: template.rawValue, options: 0, locale: .current)
    }
}


func showTime(start: NSDate, end: NSDate)-> String{
    
    let formatter = DateFormatter()
    formatter.setTemplate(.time) //12:30
    let startTime = formatter.string(from: start as Date)
    let endTime = formatter.string(from: end as Date)
    
    return startTime + " ~ " + endTime
}
