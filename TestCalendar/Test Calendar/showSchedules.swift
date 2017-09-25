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
    func showTasks(){
        var days = [Date]()
        for task in model.tasks{
            days.append(task.startTime as Date)
        }
        //draw black circle
        calendar.selectedStyleColor = .black
        calendar.selectionMode = .multiple(style: .circle)
        calendar.lineView.height = 0.2
        calendar.lineView.position = .bottom
        calendar.select(dates: days)
        print("show tasks")
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
