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
import SwiftyJSON

class CalendarModel{
    
//    class var sharedInstance: CalendarModel{
//        struct Static{
//            static let instance: CalendarModel = CalendarModel()
//        }
//        return Static.instance
//    }
    
    static let sharedInstance = CalendarModel()

    static let realm = try! Realm()
    var tasks = [Task]()
    var studies = [Study]()
    var tests = [Test]()
    
    private init(){
        self.tasks = getAllTask()
        self.studies = getAllStudy()
        self.tests = getAllTest()
    }
    
    func lastTaskId() -> Int{
        if let event = CalendarModel.realm.objects(Task.self).last{
            return event.id + 1
            print("last id")
            print(event.id)
        }else {
            return 1
        }
    }
    
    func lastStudyId() -> Int{
        if let event = CalendarModel.realm.objects(Study.self).last{
            return event.id + 1
            print("last id")
            print(event.id)
        }else {
            return 1
        }
    }
    
    func lastTestId() -> Int{
        if let event = CalendarModel.realm.objects(Test.self).last{
            print("last id")
            print(event.id)
            return event.id + 1
        }else {
            return 1
        }
    }
    
//    func lastId(object: Object) -> Int{
//        if let event = CalendarModel.realm.objects(object).last{
//            return event.id + 1
//        }else {
//            return 1
//        }
//        if let event = CalendarModel.realm.objects(object).last{
//            return event.id + 1
//            print("last id")
//            print(event.id)
//        }else {
//            return 1
//        }
//    }

    //新しいオブジェクトの作成
    func createTask() -> Task{
        let task = Task()
        task.id = self.lastTaskId()
        return task
    }
    
    func createStudy(_ json: JSON) -> Study{
        let study = Study(json: json)
        study.id = self.lastStudyId()
        return study
    }
    
    func createTest() -> Test{
        let test = Test()
        test.id = self.lastTestId()
        return test
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
    
    //１つ保存
    func save(object: Object){
        try! CalendarModel.realm.write {
            CalendarModel.realm.add(object)
        }
    }
    
    //１つ削除
    func delete(object: Object){
        try! CalendarModel.realm.write {
            CalendarModel.realm.delete(object)
        }
    }
    
//    func delete(study: Study){
//        try! CalendarModel.realm.write {
//            CalendarModel.realm.delete(study)
//        }
//    }
//    
//    func delete(test: Test){
//        try! CalendarModel.realm.write {
//            CalendarModel.realm.delete(test)
//        }
//    }
    
    /// タスクを全て渡す関数
    ///
    /// - Returns: Taskの配列
    func getAllTask() -> [Task]{
        return  CalendarModel.realm.objects(Task.self).map{$0}
    }
    
    func getAllStudy() -> [Study]{
        return  CalendarModel.realm.objects(Study.self).map{$0}
    }
    
    func getAllTest() -> [Test]{
        return  CalendarModel.realm.objects(Test.self).map{$0}
    }

}

//種別の全てのオブジェクトの取得

enum Genre:Int{
    case task, study, test
}
