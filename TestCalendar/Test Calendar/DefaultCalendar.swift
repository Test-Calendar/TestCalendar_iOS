////
////  DefaultCalendar.swift
////  Test Calendar
////
////  Created by 山浦功 on 2017/09/04.
////  Copyright © 2017年 山浦功. All rights reserved.
////
//
//import Foundation
//import UIKit
//import EventKit
//
//let eventStore = EKEventStore()
//
//// 許可状況を確認して、許可されていなかったら許可を得る
//func allowAuthorization() {
//    if getAuthorization_status() {
////         許可されている
//        return
//    } else {
//        // 許可されていない
//        eventStore.requestAccess(to: .event, completion: {
//            (granted, error) in
//            if granted {
//                return
//            }
//            else {
//                print("Not allowed")
//            }
//        })
//        
//    }
//}
//
//// 認証ステータスを確認する
//func getAuthorization_status() -> Bool {
//    // 認証ステータスを取得
//    let status = EKEventStore.authorizationStatus(for: .event)
//    
//    // ステータスを表示 許可されている場合のみtrueを返す
//    switch status {
//    case .notDetermined:
//        print("NotDetermined")
//        return false
//        
//    case .denied:
//        print("Denied")
//        return false
//        
//    case .authorized:
//        print("Authorized")
//        return true
//        
//    case .restricted:
//        print("Restricted")
//        return false
//    }
//}
//
//let calendars = eventStore.calendars(for: .event)
//
//func listEvents() {
//    // 検索条件を準備
//    let calendar = Calendar(identifier: .gregorian)
//    let startDate = calendar.date(from: DateComponents(year: 2017, month: 8, day:1))
//    let endDate = Date()
//    let defaultCalendar = eventStore.defaultCalendarForNewEvents    // ここではデフォルトのカレンダーを指定
//    // 検索するためのクエリー的なものを用意
//    let predicate = eventStore.predicateForEvents(withStart: startDate as! Date, end: endDate as Date, calendars: [defaultCalendar])
//    // イベントを検索
//    let events = eventStore.events(matching: predicate)
//    
//    print(events)
//}
// 
