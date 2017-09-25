//
//  Schedules.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/09/24.
//  Copyright © 2017年 山浦功. All rights reserved.
//

import Foundation
import Koyomi


func showSchedules(calendar: Koyomi, model: CalendarModel){
    print("show Scheduleだよ")
    
    calendar.selectionMode = .multiple(style: .line)
    let tasks = model.getAllTask()
    if tasks.isEmpty == true{
        print("Taskはないよ")
    }else {
        for task in tasks{
            calendar.selectedStyleColor = .black
            calendar.lineView.height = 0.3
            calendar.lineView.position = .bottom
            calendar.select(date: task.startTime as Date)
            print("show tasks")
        }
    }
    
    
    
    
    func showTests(){
        for test in model.tests{
            calendar.selectedStyleColor = getColor(color: test.color)
            calendar.selectionMode = .single(style: .line)
            calendar.lineView.height = 0.5
            calendar.lineView.position = .center
            calendar.select(date: test.startTime as Date)
        }
        print("show tests")
    }
    
    
    func showStudies(){
        for study in model.studies{
            calendar.selectedStyleColor = getColor(color: study.color)
            calendar.selectionMode = .multiple(style: .background)
            calendar.select(date: study.startTime as Date)
        }
        print("show studies")
    }
}
