//
//  CalendarModel.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/09/01.
//  Copyright © 2017年 山浦功. All rights reserved.
//

import UIKit
import EventKit


func addTask(name: String, notification: Bool, starttime:NSDate, endtime:NSDate, repetaion: Int){
    
    let task = Task.create()
    
    task.name = name
    task.notification = notification
    task.startTime = starttime
    task.endTime = endtime
    task.repetation = repetaion
    task.save()
    
}


func addStudy(name: String, notification: Bool, starttime: NSDate, endtime: NSDate, color:String, type:Int){
    
    let study = StudySchedule.create()
    
    study.name = name
    study.notification = notification
    study.startTime = starttime
    study.endTime = endtime
    study.color = color
    study.type = type
    study.save()
}


func addTest(name: String, notification: Bool, startTime: Date, color: String, type: Int){
    
    let test = Test.create()
    
    test.name = name
    test.notification = notification
    test.startTime = startTime as NSDate
    test.color = color
    test.type = type
    test.save()
}




class CalendarModel{
    
    static let sharedInstance = CalendarModel()
    
    var tasks = [Task]()
    var studys = [StudySchedule]()
    var tests = [Test]()
    
    private init(){}
    
}

enum Genre:Int{
    case task, study, test
}




