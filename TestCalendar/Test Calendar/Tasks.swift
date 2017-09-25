//
//  Tasks.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/09/25.
//  Copyright © 2017年 山浦功. All rights reserved.
//

import Foundation
import EventKit



/// iOSカレンダーからイベントを取得
func onClickMyButton() {
    
    let myEventStore = EKEventStore()
    let model = CalendarModel.sharedInstance
    
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
            let aa = model.createTask()
            aa.name = i.title
            aa.startTime = i.startDate as NSDate
            aa.endTime = i.endDate as NSDate
            
            print("これはrealmdだよ")
            print("aa\(aa.id)")
            print("aa" + aa.name)
            print("aa\(aa.startTime)")
            print("aa\(aa.endTime)")
            model.save(task: aa)
            
//            print(Realm.Configuration.defaultConfiguration.fileURL!)
            eventItems += ["\(i.title): \(i.startDate) * \(i.endDate)"]
        }
    }
    print(model.getAllTask())
    // 発見したイベントを格納する配列を生成.
}




/// iOSカレンダーからデータを取得
func getTasksFromDefaultCalendar(){
    let model = CalendarModel.sharedInstance
    
    let calendar: NSCalendar = NSCalendar.current as NSCalendar
    let eventStore = EKEventStore()
    var eventCalendar = eventStore.calendars(for: .event)
    let yestardayComponents: NSDateComponents = NSDateComponents()
    yestardayComponents.day = -1
    let yestarday = calendar.date(byAdding: yestardayComponents as DateComponents, to: NSDate() as Date, options: .init(rawValue: .allZeros))
    
    let oneYearFromNowComponents: NSDateComponents = NSDateComponents()
    oneYearFromNowComponents.year = 1
    let OneYearFromNow = calendar.date(byAdding: oneYearFromNowComponents as DateComponents, to: Date(), options: .init(rawValue: .allZeros))
    var predicate = NSPredicate()
    
    predicate = eventStore.predicateForEvents(withStart: yestarday!, end: OneYearFromNow!, calendars: nil)
    
    let events = eventStore.events(matching: predicate)
    print(events)
    if !events.isEmpty{
        for i in events{
            print(i.title)
            print(i.startDate)
            print(i.endDate)
            let task = model.createTask()
            task.name = i.title
            task.startTime = i.startDate as NSDate
            task.endTime = i.endDate as NSDate
            model.save(task: task)
        }
        print("データ取得完了")
    }else {
        print("データはありません")
    }
}
