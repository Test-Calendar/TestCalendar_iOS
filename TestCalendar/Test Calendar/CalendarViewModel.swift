//
//  CalendarViewModel.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/09/01.
//  Copyright © 2017年 山浦功. All rights reserved.
//

import UIKit
import RealmSwift

func addTask(name: String, notification: Bool, starttime:NSDate, endtime:NSDate, repetaion: Int){
    let task = Task()
    task.id = 1 //必要？
    task.name = name
    task.notification = notification
    task.startTime = starttime
    task.endTime = endtime
    task.repetation = repetaion
    let realm = try! Realm()
    
    try! realm.write {
        realm.add(task)
    }
}

func addStudy(name: String, notification: Bool, starttime: NSDate, endtime: NSDate, color:String, type:Int){
    let study = StudySchedule()
    study.id = 2
    study.name = name
    study.notification = notification
    study.startTime = starttime
    study.endTime = endtime
    study.color = color
    study.type = type
    let realm = try! Realm()
    
    try! realm.write {
        realm.add(study)
    }
}

func addTest(test: Test){
    test.id = 3
    
    let realm = try! Realm()
    
    try! realm.write {
        realm.add(test)
    }
    
}
