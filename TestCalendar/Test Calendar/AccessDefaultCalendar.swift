//
//  Tasks.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/09/25.
//  Copyright © 2017年 山浦功. All rights reserved.
//

import Foundation
import EventKit
import UIKit


protocol AccessDefaultCalendarDelegate {
    func showAlart()
}


class AccessDefaultCalendar{
    
    let eventStore = EKEventStore()
    var delegate: AccessDefaultCalendarDelegate?
    
    /// iOSカレンダーから
    func getTasksFromDefaultCalendar(){
        //アクセスの確認
//        allowAuthorization()
        
        let model = CalendarModel.sharedInstance
        let calendar: NSCalendar = NSCalendar.current as NSCalendar
        var eventCalendar = eventStore.calendars(for: .event)
        let yestardayComponents: NSDateComponents = NSDateComponents()
        yestardayComponents.day = -1
        let yestarday = calendar.date(byAdding: yestardayComponents as DateComponents, to: Date(), options: .init(rawValue: .allZeros))
        
        let oneYearFromNowComponents: NSDateComponents = NSDateComponents()
        oneYearFromNowComponents.year = 1
        let OneYearFromNow = calendar.date(byAdding: oneYearFromNowComponents as DateComponents, to: Date(), options: .init(rawValue: .allZeros))
        var predicate = NSPredicate()
        
        predicate = eventStore.predicateForEvents(withStart: yestarday!, end: OneYearFromNow!, calendars: nil)
        
        let events = eventStore.events(matching: predicate)
        
        if !events.isEmpty{
            for i in events{
                print("ここよ＝＝")
                print(i.title)
                print(i.startDate)
                print(i.endDate)
                let predicate = NSPredicate(format: "name == %@ AND startTime == %@ ", i.title, i.startDate as CVarArg)
                let data = model.searchTask(predicate: predicate)
                if data.isEmpty == true{
                    print("新しいデータです")
                    let task = model.createTask()
                    task.name = i.title
                    task.startTime = i.startDate as NSDate
                    task.endTime = i.endDate as NSDate
                    model.save(object: task)
                } else {
                    print("すでにあるデータです")
                }
            }
            print("データ取得完了")
        }else {
            print("データはありません")
        }
    }
}


extension AccessDefaultCalendar{
    
    /// カレンダーへのアクセスを確認する
    ///
    /// - Returns: (許可: true, 許可なし: false)を返す
    func getAuthorization_status() -> Bool {
        let status: EKAuthorizationStatus = EKEventStore.authorizationStatus(for: .event)
        switch status {
        case EKAuthorizationStatus.notDetermined:
            print("NotDetermined")
            return false
        case EKAuthorizationStatus.denied:
            print("Denied")
            return false
        case EKAuthorizationStatus.authorized:
            print("Authorized")
            return true
        case EKAuthorizationStatus.restricted:
            print("Restricted")
            return false
        default:
            print("error")
            return false
        }
    }
    
    
    /// カレンダーへの許可があるのかを確認する
    func allowAuthorization(){
        if getAuthorization_status() {
            getTasksFromDefaultCalendar()
        } else {
            eventStore.requestAccess(to: .event, completion: {
                (granted , error) -> Void in
                if granted {
                    return
                }
                else {
                    self.delegate?.showAlart()
                }
            })
        }
        
    }
}

