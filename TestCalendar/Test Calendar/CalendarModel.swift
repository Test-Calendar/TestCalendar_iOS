//
//  CalendarModel.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/09/01.
//  Copyright © 2017年 山浦功. All rights reserved.
//

import UIKit
import EventKit
import RealmSwift

class CalendarModel{
    static let sharedInstance = CalendarModel()
    
    let realm = try! Realm()
    
    var tasks = [Task]()
    var studies = [Study]()
    var tests = [Test]()
    
    func searchTask(predicate: NSPredicate)-> [Task]{
        return realm.objects(Task.self).filter(predicate).map{$0}
    }
    
    func searchStudy(predicate: NSPredicate)-> [Study]{
        return realm.objects(Study.self).filter(predicate).map{$0}
    }
    
    func searchTest(predicate: NSPredicate)-> [Test]{
        return realm.objects(Test.self).filter(predicate).map{$0}
    }
}



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
    
    let study = Study.create()
    
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


enum Genre:Int{
    case task, study, test
}




