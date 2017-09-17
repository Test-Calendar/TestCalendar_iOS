//
//  Calendar.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/09/01.
//  Copyright © 2017年 山浦功. All rights reserved.
//

import UIKit
import SwiftyJSON
import RealmSwift


class Event: Object{
    
    dynamic var id = 0
    dynamic var name = ""
    dynamic var notification = false
    dynamic var startTime = NSDate()
    
    
    override static func primaryKey() -> String {
        return "id"
    }
    
    
    static func lastId() -> Int{
        if let event = realm.objects(self).last{
            print(event.id)
            return event.id + 1
        }else {
            return 1
        }
    }
    
    
    func deleteAll(){
        try! Event.realm.write {
            Event.realm.deleteAll()
        }
    }
    
    
    convenience init(json: JSON){
        self.init(json: json)
        self.id = json["id"].intValue
        self.name = json["name"].stringValue
        self.notification = json["notification"].boolValue
        let unixtime = json["startTime"].intValue
        self.startTime = NSDate(timeIntervalSince1970: TimeInterval(unixtime))
    }
}



class Task: Event{
    
    dynamic var endTime = NSDate()
    dynamic var repetation = 0
    
    
    static func create() ->Task{
        let task = Task()
        task.id = lastId()
        return task
    }
    
    
    func save(){
        try! Task.realm.write {
            Task.realm.add(self)
        }
    }
    
    
    static func getAll() -> [Task]{
        let tasks = Task.realm.objects(Task.self)
        var ret: [Task] = []
        for task in tasks{
            ret.append(task)
        }
        return ret
    }
    
    
    func delete(){
        let tasks = Task.realm.objects(Task.self)
        try! Task.realm.write {
            Task.realm.delete(tasks)
        }
    }
   
    
    convenience init(json:JSON){
        self.init(json: json)
        let unixtime = json["endTime"].intValue
        self.endTime = NSDate.init(timeIntervalSince1970: TimeInterval(unixtime))
        self.repetation = json["repetation"].intValue
    }
}



class Study: Event{
    
    dynamic var endTime = NSDate()
    dynamic var color = ""
    dynamic var type = 0 //テストかレポートか
    
    convenience init(json:JSON){
        self.init(json: json)
        let unixtime = json["endTime"].intValue
        self.endTime = NSDate.init(timeIntervalSince1970: TimeInterval(unixtime))
        self.color = json["color"].stringValue
        self.type = json["type"].intValue
    }
    
    
    static func create() -> Study{
        let study = Study()
        study.id = lastId()
        return study
    }
    
    
    func save(){
        try! Study.realm.write {
            Study.realm.add(self)
        }
    }
    
    
    static func delete(){
        let studys = realm.objects(self)
        try! realm.write {
            realm.delete(studys)
        }
    }
    
    
    static func getAll() -> [Study]{
        let studys = realm.objects(Study.self)
        var ret: [Study] = []
        for study in studys{
            ret.append(study)
        }
        return ret
    }
}



class Test: Event{
    dynamic var color = ""
    dynamic var type = 0 //テストかレポートか
    
    static func create() -> Test{
        let test = Test()
        test.id = lastId()
        return test
    }

    
    func save(){
        try! Test.realm.write {
            Test.realm.add(self)
        }
    }
    
    
    static func delete(){
        let tests = realm.objects(self)
        try! realm.write {
            realm.delete(tests)
        }
    }
    
    
    static func getAll() -> [Test]{
        let tests = realm.objects(Test.self)
        var ret: [Test] = []
        for test in tests{
            ret.append(test)
        }
        return ret
    }
    
    
    convenience init(json: JSON){
        self.init(json: json)
        self.color = json["color"].stringValue
        self.type = json["type"].intValue
    }
}


enum type: Int{
    case test,report
}


