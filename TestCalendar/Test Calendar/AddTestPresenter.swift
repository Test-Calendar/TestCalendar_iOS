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
        let test = model.searchTest(predicate: predicate)
        if test.isEmpty == true{
            let newTest = model.createTest()
            newTest.name = data.name
            newTest.type = data.type
            newTest.color = data.color
            newTest.notification = data.notification
            newTest.studyHour = data.study
            newTest.startTime = data.time
            model.save(object: newTest)
        } else {
            test[0].name = data.name
            test[0].type = data.type
            test[0].color = data.color
            test[0].notification = data.notification
            test[0].studyHour = data.study
            test[0].startTime = data.time
            model.save(object: test[0])
        }
    }
}
