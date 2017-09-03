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
    
    override static func primaryKey() -> String { return "id" }
    
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
    
    convenience init(json:JSON){
        self.init(json: json)
        let unixtime = json["endTime"].intValue
        self.endTime = NSDate.init(timeIntervalSince1970: TimeInterval(unixtime))
        self.repetation = json["repetation"].intValue
    }
}

class StudySchedule: Event{
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
}

class Test: Event{
    dynamic var color = ""
    dynamic var type = 0 //テストかレポートか
    
    convenience init(json: JSON){
        self.init(json: json)
        self.color = json["color"].stringValue
        self.type = json["type"].intValue
    }
}


enum type: Int{
    case test,report
}


