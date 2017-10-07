//
//  MakeTestCalendar.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/10/07.
//  Copyright © 2017年 山浦功. All rights reserved.
//

import Foundation


/// テストの情報
struct TestListViewModel{
    var name: String
    var type: Int
    var color: String
    var notification: Bool
    var study: Int
    var time: NSDate
}

enum TestInfoStatus {
    case normal
    case none
}


//protocol TestListPresenter {
//    func loadData()
////    func selectData(testInfo: )
//}
//
////class TestInfoPresenter: TestInfoPresenter {
////    
////}
////
