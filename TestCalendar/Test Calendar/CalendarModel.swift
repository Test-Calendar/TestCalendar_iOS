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
    static let realm = try! Realm()
    
    var tasks = [Task]()
    var studies = [Study]()
    var tests = [Test]()
    
    func lastId() -> Int{
        if let event = CalendarModel.realm.objects(Event.self).last{
            return event.id + 1
        }else {
            return 1
        }
    }
    
    //クエリ
    func searchTask(predicate: NSPredicate)-> [Task]{
        return CalendarModel.realm.objects(Task.self).filter(predicate).map{$0}
    }
    
    func searchStudy(predicate: NSPredicate)-> [Study]{
        return CalendarModel.realm.objects(Study.self).filter(predicate).map{$0}
    }
    
    func searchTest(predicate: NSPredicate)-> [Test]{
        return CalendarModel.realm.objects(Test.self).filter(predicate).map{$0}
    }
    
    //種別の全てのオブジェクトの取得
    func getAllTask() -> [Task]{
        return  CalendarModel.realm.objects(Task.self).map{$0}
    }
    
    func getAllStudy() -> [Study]{
        return  CalendarModel.realm.objects(Study.self).map{$0}
    }
    
    func getAllTest() -> [Test]{
        return  CalendarModel.realm.objects(Test.self).map{$0}
    }
    
    //新しいオブジェクトの作成
    func create() ->Task{
        let task = Task()
        task.id = self.lastId()
        return task
    }
    
    func create() -> Study{
        let study = Study()
        study.id = self.lastId()
        return study
    }
    
    func create() -> Test{
        let test = Test()
        test.id = self.lastId()
        return test
    }
    
    //１つ保存
    func save(task: Task){
        try! CalendarModel.realm.write {
            CalendarModel.realm.add(task)
        }
    }
    
    func save(study: Study){
        try! CalendarModel.realm.write {
            CalendarModel.realm.add(study)
        }
    }
    
    func save(test: Test){
        try! CalendarModel.realm.write {
            CalendarModel.realm.add(test)
        }
    }

    //１つ削除
    func delete(task: Task){
        try! CalendarModel.realm.write {
            CalendarModel.realm.delete(task)
        }
    }
    
    func delete(study: Study){
        try! CalendarModel.realm.write {
            CalendarModel.realm.delete(study)
        }
    }
    
    func delete(test: Test){
        try! CalendarModel.realm.write {
            CalendarModel.realm.delete(test)
        }
    }
}

enum Genre:Int{
    case task, study, test
}




