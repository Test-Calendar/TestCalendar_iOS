//
//  CalendarViewModel.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/09/01.
//  Copyright © 2017年 山浦功. All rights reserved.
//


import UIKit
import EventKit


func onClickMyButton(sender: UIButton) {
    print("onClickMyButton")
    
    var myEventStore: EKEventStore!
    
    // NSCalendarを生成.
    let myCalendar: NSCalendar = NSCalendar.current as NSCalendar
    
    // ユーザのカレンダーを取得.
    var myEventCalendars = myEventStore.calendars(for: EKEntityType.event)
    
    // 開始日(昨日)コンポーネントの生成.
    let oneDayAgoComponents: NSDateComponents = NSDateComponents()
    oneDayAgoComponents.day = -1
    
    // 昨日から今日までのNSDateを生成.
    let oneDayAgo: NSDate = myCalendar.date(byAdding: oneDayAgoComponents as DateComponents, to: Date(), options: NSCalendar.Options.init(rawValue: .allZeros))! as NSDate
    
    
    // 終了日(一年後)コンポーネントの生成.
    let oneYearFromNowComponents: NSDateComponents = NSDateComponents()
    oneYearFromNowComponents.year = 1
    
    // 今日から一年後までのNSDateを生成.
    let oneYearFromNow: NSDate = myCalendar.date(byAdding: oneYearFromNowComponents as DateComponents, to: Date(), options: .init(rawValue: .allZeros))! as NSDate
    
    
    
    // イベントストアのインスタンスメソッドで述語を生成.
    var predicate = NSPredicate()
    
    // ユーザーの全てのカレンダーからフェッチせよ.
    predicate = myEventStore.predicateForEvents(withStart: oneDayAgo as Date,
                                                end: oneYearFromNow as Date,
                                                calendars: nil)
    
    // 述語にマッチする全てのイベントをフェッチ.
    let events = myEventStore.events(matching: predicate)
    
    //        print(events)
    
    var eventItems = [String]()
    
    if !events.isEmpty {
        for i in events{
            print(i.title)
            print(i.startDate)
            print(i.endDate)
            // 配列に格納.
                       eventItems += ["\(i.title): \(i.startDate) * \(i.endDate)"]
        }
    }
    // 発見したイベントを格納する配列を生成.
}

