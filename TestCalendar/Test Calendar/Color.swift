//
//  Color.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/09/01.
//  Copyright © 2017年 山浦功. All rights reserved.
//


import UIKit



struct CalendarColor {
    
    static func black() -> UIColor {
        return UIColor(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    static func gray() -> UIColor {
        return UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
    }
    
    static func buttonColor() -> UIColor {
        return UIColor(red: 255/255, green: 71/255, blue: 58/255, alpha: 1)
    }
    
    static func redColor() -> UIColor{
        return UIColor(red: 235/255, green: 87/255, blue: 87/255, alpha: 1)
    }
    
    static func orangeColor() -> UIColor {
        return UIColor(red: 242/255, green: 153/255, blue: 74/255, alpha: 1)
    }
    
    static func yellowColor() -> UIColor{
        return UIColor(red: 242/255, green: 201/255, blue: 71/255, alpha: 1)
    }
    
    static func darkGreen() -> UIColor {
        return UIColor(red: 33/255, green: 156/255, blue: 83/255, alpha: 1)
    }
    
    static func green() -> UIColor {
        return UIColor(red: 39/255, green: 174/255, blue: 96/255, alpha: 1)
    }
    
    static func lightGreen() -> UIColor{
        return UIColor(red: 111/255, green: 207/255, blue: 151/255, alpha: 1)
    }
    
    static func darkBlue() -> UIColor {
        return UIColor(red: 47/255, green: 128/255, blue: 237/255, alpha: 1)
    }
    
    static func blue() -> UIColor {
        return UIColor(red: 45/255, green: 156/255, blue: 219/255, alpha: 1)
    }
    
    static func lightBlue() -> UIColor {
        return UIColor(red: 86/255, green: 204/255, blue: 242/255, alpha: 1)
    }
    
    static func darkPurple() -> UIColor {
        return UIColor(red: 155/255, green: 81/255, blue: 224/255, alpha: 1)
    }
    
    static func lightPurple() -> UIColor {
        return UIColor(red: 187/255, green: 107/255, blue: 217/255, alpha: 1)
    }
    
    static func watchBackgroundColor() -> UIColor {
        return UIColor(red: 235/255, green: 238/255, blue: 240/255, alpha: 1)
    }
}



func getColor(_ color: String) -> UIColor{
    switch color {
    case "red" : return CalendarColor.redColor()
    case "orange" : return CalendarColor.orangeColor()
    case "yellow" : return CalendarColor.yellowColor()
    case "darkGreen" : return CalendarColor.darkGreen()
    case "green" : return CalendarColor.green()
    case "lightGreen" : return CalendarColor.lightGreen()
    case "darkBlue" : return CalendarColor.darkBlue()
    case "blue" : return CalendarColor.blue()
    case "lightBlue" : return CalendarColor.lightBlue()
    case "darkPurple" : return CalendarColor.darkPurple()
    case "black" :  return CalendarColor.black()
    default: return CalendarColor.buttonColor()
    }
}


struct WatchButtonColor{
    
    static func selected() -> UIColor{
        return UIColor(red: 0/255, green: 150/255, blue: 136/255, alpha: 1.0)
    }
    
    static func enabled() -> UIColor{
        return UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
    }
}


var colors: [UIColor] = [CalendarColor.redColor(), CalendarColor.orangeColor(), CalendarColor.yellowColor(), CalendarColor.darkGreen(), CalendarColor.green(), CalendarColor.lightGreen(),CalendarColor.darkBlue(), CalendarColor.blue(), CalendarColor.lightBlue(), CalendarColor.darkPurple(), CalendarColor.lightPurple()]
var colorNames = ["red", "orange", "yellow", "darkGreen", "green", "lightGreen", "darkBlue", "blue", "lightBlue", "darkPuple", "lightPuple"]
