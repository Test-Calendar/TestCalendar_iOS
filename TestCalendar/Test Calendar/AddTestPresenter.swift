//
//  AddTestPresenter.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/10/08.
//  Copyright © 2017年 山浦功. All rights reserved.
//

import Foundation


protocol AddTestPresenter {
    func updateTest(_ data: TestListViewModel)
}


class HomeAddTestPresenter: AddTestPresenter{
    
    var model = CalendarModel.sharedInstance
    
    func updateTest(_ data: TestListViewModel){
        let predicate = NSPredicate(format: "name == %@", data.name)
        let tests = model.searchTest(predicate: predicate)
        if tests.isEmpty == true{
            let newTest = model.createTest()
            newTest.name = data.name
            newTest.type = data.type
            newTest.color = data.color
            newTest.notification = data.notification
            newTest.studyHour = data.study
            newTest.startTime = data.time
            model.save(object: newTest)
        } else {
        }
    }
}
