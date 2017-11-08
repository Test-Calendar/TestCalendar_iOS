//
//  Schedules.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/09/24.
//  Copyright © 2017年 山浦功. All rights reserved.
//

import Foundation
import Koyomi


/// カレンダーにイベントを丸や線で表示する
///
/// - Parameters:
///   - calendar: 読み込むKoyomi
///   - model: 利用するデータモデル
func showSchedules(calendar: Koyomi, model: CalendarModel){
    print("show Scheduleだよ")
    
    calendar.selectionMode = .multiple(style: .circle)
    calendar.selectedStyleColor = .blue
    calendar.lineView.height = 0.3
    calendar.lineView.position = .bottom

    let tasks = model.getAllTask()
    var days = [Date]()
    if tasks.isEmpty == false{
        for i in tasks{
            days.append(i.startTime as Date)
        }
//        calendar.select(dates: days)
    }
    calendar.select(dates: days)
    
    
    func showTests(){
        for test in model.tests{
            calendar.selectedStyleColor = getColor(test.color)
            calendar.selectionMode = .single(style: .line)
            calendar.lineView.height = 0.5
            calendar.lineView.position = .center
            calendar.select(date: test.startTime as Date)
        }
        print("show tests")
    }
    
    
    func showStudies(){
        for study in model.studies{
            calendar.selectedStyleColor = getColor(study.color)
            calendar.selectionMode = .multiple(style: .background)
            calendar.select(date: study.startTime as Date)
        }
        print("show studies")
    }
}


enum DataType{
    case task
    case test
    case study
}

func getEventDates(_ model: CalendarModel, _ type: DataType) -> [Date] {
    var data = [Any]()
    var days = [Date]()
    switch type {
    case .task: data = model.getAllTask()
    case .test: data = model.getAllTest()
    case .study: data = model.getAllStudy()
    }
    
    if data.isEmpty == false {
        for i in data {
            days.append((i as AnyObject).startTime as Date)
        }
    }
    return days
}
