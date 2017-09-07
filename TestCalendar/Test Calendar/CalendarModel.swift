//
//  CalendarModel.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/09/01.
//  Copyright © 2017年 山浦功. All rights reserved.
//

import UIKit
import RealmSwift


class CalendarModel{
    static let sharedInstance = CalendarModel()
    
    private init(){}
    
    var tasks = [Task]()
    var studys = [StudySchedule]()
    var tests = [Test]()
    
    func addTask(){
        
    }
    
    func deleteTask(){
        
    }
    
    func getOneDaySubject(){
        
    }
}

enum Genre:Int{
    case task, study, test
}


