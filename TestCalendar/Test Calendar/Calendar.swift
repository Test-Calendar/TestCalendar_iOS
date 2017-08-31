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
    dynamic var startTime = Date()
}

class Task: Event{
    dynamic var endTime = Date()
    dynamic var repetation = 0
}


class StudySchedule: Event{
    dynamic var endTime = Date()
    dynamic var color = ""
    dynamic var type = 0 //テストかレポートか
}

class Test: Event{
    dynamic var color = ""
    dynamic var type = 0 //テストかレポートか
}

enum type: Int{
    case test,report
}
