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


class AccessToCalendar{
    
    let eventStore = EKEventStore()
    
    /// iOSカレンダーからデータを取得
    func getTasksFromDefaultCalendar(){
        
        let model = CalendarModel.sharedInstance
        let calendar: NSCalendar = NSCalendar.current as NSCalendar
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

   
    /// カレンダーへのアクセスを許可しているかどうかを確認する
    ///
    /// - Returns: 許可されていればtrue, されていなければfalse
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
}


//初回処理
// 許可がされいくかどうか確認して、されていなければ許可を求める
func allowAuthorization(){
            if getAuthorization_status(self) {
                return
            } else {
                eventStore.requestAccess(to: .event, completion: {
                    (granted , error) -> Void in
                    if granted {
                        return
                    }
                    else {
                        DispatchQueue.main.async(execute: { () -> Void in
                            let myAlert = UIAlertController(title: "許可されませんでした", message: "Privacy->App->Reminderで変更してください", preferredStyle: UIAlertControllerStyle.alert)
                            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)

                            myAlert.addAction(okAction)
                            //                        self.presentViewController(myAlert, animated: true, completion: nil)
                        })
                    }
                })
            }
}
