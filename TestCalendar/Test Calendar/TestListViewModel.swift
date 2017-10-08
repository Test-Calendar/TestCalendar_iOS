//
//  MakeTestCalendar.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/10/07.
//  Copyright © 2017年 山浦功. All rights reserved.
//
import Foundation



/// MTCViewModel　is used in MakeTestCalendar
protocol MTCViewModel {
    var name: String { get }
    var type: Int { get }
    var color: String { get }
    var notification: Bool { get }
    var study: Int { get }
    var time: NSDate { get }
}



struct TestListsViewModel {
    var testLists: [TestListViewModel] = []
}

/// テストの情報
struct TestListViewModel{
    var name: String
    var type: Int
    var color: String
    var notification: Bool
    var study: Int
    var time: NSDate
}

