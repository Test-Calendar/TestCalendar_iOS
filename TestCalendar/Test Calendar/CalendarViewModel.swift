//
//  CalendarViewModel.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/09/01.
//  Copyright © 2017年 山浦功. All rights reserved.
//

import Foundation
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
    let oneDayAgo = myCalendar.date(byAdding: oneDayAgoComponents as DateComponents, to: Date(), options: NSCalendar.Options.init(rawValue: .allZeros))
//        myCalendar.date(byAdding: oneDayAgoComponents as DateComponents, to: Date, options: NSCalendar.Options.init(rawValue: .allZeros))! as NSDate
    // 終了日(一年後)コンポーネントの生成.
    let oneYearFromNowComponents: NSDateComponents = NSDateComponents()
    oneYearFromNowComponents.year = 1
    // 今日から一年後までのNSDateを生成.
    let oneYearFromNow: NSDate = myCalendar.date(byAdding: oneYearFromNowComponents as DateComponents, to: Date(), options: .init(rawValue: .allZeros))! as NSDate
    // イベントストアのインスタンスメソッドで述語を生成.
    var predicate = NSPredicate()
    
    // ユーザーの全てのカレンダーからフェッチせよ.
    predicate = myEventStore.predicateForEvents(withStart: oneDayAgo as! Date,
                                                end: oneYearFromNow as Date,
                                                calendars: nil)
    // 述語にマッチする全てのイベントをフェッチ.
    let events = myEventStore.events(matching: predicate)
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


struct CalendarViewModel {
    var day: String
    var test: UIColor
    var colors: [UIColor]
}


protocol CalendarViewDelegate {
    func getData() -> [CalendarViewModel]
    func daysAquisition() -> Int
    func firstDateOfMonth() -> NSDate
    func dateForCellAtIndexPath(numberOfItems: Int)
}


class CalendarViewManager: CalendarViewDelegate {
    
    let model =  CalendarModel.sharedInstance
    var currentMonthOfDates = [NSDate]()
    var selectedDate = NSDate()
    let daysPerWeek: Int = 7
    var numberOfItems: Int!
    
    /// すべてのデータを取得し、日付ごとの構造体に入れる。
    ///
    /// - Returns: 日付のごとの予定の配列を返す
    func getData() -> [CalendarViewModel] {
        var data = [CalendarViewModel]()
        let tasks = model.getAllTask()
        let tests = model.getAllTest()
        let studies = model.getAllStudy()
        
        if tasks.isEmpty == false {
            for task in tasks {
                
            }
        }
        if tests.isEmpty == false {
            
        }
        if studies.isEmpty == false {
            
        }
        return data
    }
    
    /// 月ごとのセルの数を返す
    ///
    /// - Returns: セルの数
    func daysAquisition() -> Int {
        let rangeOfWeeks = NSCalendar.current.range(of: .weekOfMonth, in: .month, for: firstDateOfMonth() as Date)
        let numberOfWeeks = rangeOfWeeks?.count
        numberOfItems = numberOfWeeks! * daysPerWeek
        return numberOfItems
    }
    
    /// 月の初日を取得
    ///
    /// - Returns: 日付
    func firstDateOfMonth() -> NSDate {
        var components = NSCalendar.current.dateComponents([.year, .month, .day], from: selectedDate as Date)
        components.day = 1
        return NSCalendar.current.date(from: components)! as NSDate
    }
    
    /// 表示する日付の取得
    ///
    /// - Parameter numberOfItems: numberOfItems description
    func dateForCellAtIndexPath(numberOfItems: Int) {
        // ①「月の初日が週の何日目か」を計算する
        let ordinalityOfFirstDay = Calendar.current.ordinality(of: .day, in: .weekOfMonth, for: firstDateOfMonth() as Date)
        for i in 0 ..< numberOfItems {
            // ②「月の初日」と「indexPath.item番目のセルに表示する日」の差を計算する
            let dateComponents = NSDateComponents()
            dateComponents.day = i - (ordinalityOfFirstDay! - 1)
            // ③ 表示する月の初日から②で計算した差を引いた日付を取得
            let date = Calendar.current.date(byAdding: dateComponents as DateComponents, to: firstDateOfMonth() as Date)
//                                               option: NSCalendar.Options(rawValue: 0))
            currentMonthOfDates.append(date! as NSDate)
        }
    }
    
    /// ヘッダーの月を変更
    ///
    /// - Parameter indexPath:
    /// - Returns: String型
    func conversionDateFormat(indexPath: IndexPath) -> String {
        dateForCellAtIndexPath(numberOfItems: numberOfItems)
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "d"
        return formatter.string(from: currentMonthOfDates[indexPath.row] as Date)
    }
    
    /// 前月の表示をする
    ///
    /// - Parameter date: 今表示している月の日付を渡す
    /// - Returns: 前月の日付を返す
    func prevMonth(date: NSDate) -> NSDate {
        currentMonthOfDates = []
        selectedDate = date.monthAgoDate()
        return selectedDate
    }
    
    /// 次の月を表示させる
    ///
    /// - Parameter date: 今表示している月の日付を渡す
    /// - Returns: 次の月の日付を返す
    func nextMonth(date: NSDate) -> NSDate {
        currentMonthOfDates = []
        selectedDate = date.monthLaterDate()
        return selectedDate
    }
}


extension NSDate {
    
    /// 前の月の日付に変換する
    ///
    /// - Returns: NSDate型で返す
    func monthAgoDate() -> NSDate {
        let addValue = -1
        let calendar = NSCalendar.current
        var dateComponents = DateComponents()
        dateComponents.month = addValue
        return calendar.date(byAdding: dateComponents, to: self as Date)! as NSDate
    }
    
    /// 次の月の日付に変換する
    ///
    /// - Returns: NSDate型で返す
    func monthLaterDate() -> NSDate {
        let addValue: Int = 1
        let calendar = NSCalendar.current
        var dateComponents = DateComponents()
        dateComponents.month = addValue
        return calendar.date(byAdding: dateComponents, to: self as Date)! as NSDate
    }
}
