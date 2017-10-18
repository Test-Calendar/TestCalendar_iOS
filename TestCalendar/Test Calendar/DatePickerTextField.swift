//
//  DatePickerTextField.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/10/16.
//  Copyright © 2017年 山浦功. All rights reserved.
//

import Foundation
import UIKit

class DatePickerTextField: UITextField {
    
    let datePickerView = UIDatePicker()
    let dateFormatter = DateFormatter()
    let toolBar = UIToolbar()
    var date = NSDate()
    
    override func awakeFromNib() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.handleFocused(notification:)), name: NSNotification.Name.UITextFieldTextDidBeginEditing, object: nil)
    }
    
    func handleFocused(notification: NSNotification!) {
        datePickerView.datePickerMode = .date
        
        //UITextField の inputView のプロパティに UIDatePicker を設定
        self.inputView = datePickerView
        
        // UIToolbar の設定
        toolBar.frame = CGRect(x:0, y:self.frame.size.height/6, width: self.frame.size.width, height: 40.0)
        toolBar.layer.position = CGPoint(x: self.frame.size.width/2, y: self.frame.size.height-20.0)
        toolBar.barStyle = .blackTranslucent
        toolBar.tintColor = UIColor.white
        toolBar.backgroundColor = UIColor.black
        
        let toolBarBtn = UIBarButtonItem(title: "完了", style: .plain, target: self, action: #selector(self.tappedToolBarBtn(sender:)))
        let toolBarBtnToday = UIBarButtonItem(title: "今日", style: .plain, target: self, action: #selector(self.tappedToolBarBtnToday(sender:)))
        toolBarBtn.tag = 1
        toolBar.items = [toolBarBtn, toolBarBtnToday]
        
        // UITextField の inputAccessoryView のプロパティに UIToolbar を設定
        self.inputAccessoryView = toolBar
        
        datePickerView.addTarget(self, action: #selector(self.handleDatePicker(sender:)), for: .valueChanged)
    }
    
    func handleDatePicker(sender: UIDatePicker) {
        dateFormatter.dateFormat = "yyyy/MM/dd"
        super.text = dateFormatter.string(from: sender.date)
        date = sender.date as NSDate
    }
    
    func tappedToolBarBtn(sender: UIBarButtonItem) {
        super.resignFirstResponder()
    }
    
    func tappedToolBarBtnToday(sender: UIBarButtonItem) {
        dateFormatter.dateFormat = "yyyy/MM/dd"
        let currentDate = NSDate()
        datePickerView.date = currentDate as Date
        super.text = dateFormatter.string(from: currentDate as Date)
    }
    
    func getDate() -> NSDate {
        return date
    }
}
