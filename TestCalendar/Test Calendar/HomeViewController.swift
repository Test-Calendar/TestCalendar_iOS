//
//  HomeViewController.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/08/31.
//  Copyright © 2017年 山浦功. All rights reserved.
//

import UIKit
import MaterialComponents
import Koyomi



class HomeViewController: UIViewController{
    
    @IBOutlet weak var month: UILabel! {
        didSet{
            let currentDateString = calendar.currentDateString(withFormat: "yyyy年MM月")
            month.text = currentDateString
        }
    }
    
    @IBOutlet weak var calendar: Koyomi! {
        didSet{
            calendar.sectionSpace = 1.5
            calendar.cellSpace = 0.5
            calendar.inset = .zero
            calendar.weekCellHeight = 25
            calendar.weeks = ("日", "月", "火", "水", "木", "金", "土")
            calendar.dayPosition = .topLeft
//            calendar.selectionMode = .multiple(style: .background)
            calendar.calendarDelegate = self
        }
    }
    
    
    @IBAction func previousMonth(_ sender: Any) {
        calendar.display(in: .previous)
        let currentDateString = calendar.currentDateString(withFormat: "yyyy年MM月")
        month.text = currentDateString
    }

    
    @IBAction func nextMonth(_ sender: Any) {
        calendar.display(in: .next)
        let currentDateString = calendar.currentDateString(withFormat: "yyyy年MM月")
        month.text = currentDateString
    }
    
    
    fileprivate let invalidPeriodLength = 90
    var model = CalendarModel.sharedInstance
    var buttonType = true //+ボタンの状態
    var add = AddButton()
    var todo = AddSmallButton()
    var test = AddSmallButton()
    let access = AccessDefaultCalendar()
    
    override func loadView() {
        super.loadView()
        self.view.addSubview(statusBar())
        add.frame = CGRect(x: self.view.frame.width * 0.79, y:self.view.frame.height * 0.87 , width: 56, height: 56)
        todo.frame = CGRect(x: self.view.frame.width * 0.79 + 4, y:self.view.frame.height * 0.87 - 135 , width: 48, height: 48)
        test.frame = CGRect(x: self.view.frame.width * 0.79 + 4, y:self.view.frame.height * 0.87 - 70, width: 48, height: 48)
        todo.buttontag = 1
        test.buttontag = 2
        todo.setTitle("TASK", for: .normal)
        test.setTitle("TEST", for: .normal)
        self.view.addSubview(add)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        add.delegate = self
        todo.delegate = self
        test.delegate = self
        
        access.delegate = self
        access.allowAuthorization()
        showSchedules(calendar: calendar, model: model)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}




extension HomeViewController: KoyomiDelegate{
    
    func koyomi(_ koyomi: Koyomi, didSelect date: Date?, forItemAt indexPath: IndexPath) {
        guard let next = UIStoryboard(name: "ShowDetail", bundle: nil).instantiateInitialViewController() as? ShowDayViewController else {
            print("Could not instantiate view controller with identifier of type SecondViewController")
            return
        }
        next.date = date! as NSDate
        self.navigationController?.pushViewController(next, animated: true)
        self.showDetailViewController(next, sender: nil)
    }
    
    
    func koyomi(_ koyomi: Koyomi, currentDateString dateString: String) {
        print(dateString)
    }
    
    @objc(koyomi:shouldSelectDates:to:withPeriodLength:)
    func koyomi(_ koyomi: Koyomi, shouldSelectDates date: Date?, to toDate: Date?, withPeriodLength length: Int) -> Bool {
        if length > invalidPeriodLength {
            print("More than \(invalidPeriodLength) days are invalid period.")
            return false
        }
        return true
    }
}


extension HomeViewController:AddButtonDelegate, AddSmallDelegate{
    
    /// 「+」ボタンが押された時に呼ばれる関数
    ///
    /// - Parameter type: ボタンの状態(true: +, false: x)
    func tapped(type: Bool) {
        if type == true{
            add.type = false
            add.setTitle("x", for: .normal)
            add.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(14))
            self.view.addSubview(todo)
            self.view.addSubview(test)
        }else {
            add.type = true
            add.setTitle("+", for: .normal)
            todo.removeFromSuperview()
            test.removeFromSuperview()
        }
    }
    
    
    /// 「テスト」、「TODO」ボタンが押されたに呼ばれる関数
    ///
    /// - Parameter tag: ボタンの種類(1: TODO, 2: テスト)
    func tapped(tag: Int) {
        if tag == 1{
            //task 画面遷移
            let storyboard: UIStoryboard = UIStoryboard(name: "AddEvent", bundle: nil)
            let inital = storyboard.instantiateInitialViewController()
            self.showDetailViewController(inital!, sender: nil)
        }else{
            //画面遷移
            let storyboard: UIStoryboard = UIStoryboard(name: "MakeTestCalendar", bundle: nil)
            let inital = storyboard.instantiateInitialViewController()
            let navi = UINavigationController(rootViewController: inital!)
            self.showDetailViewController(navi, sender: nil)
        }
    }
}

extension HomeViewController: AccessDefaultCalendarDelegate{
    
    /// カレンダーへのアクセスを求める
    func showAlart() {
        DispatchQueue.main.async(execute: { () -> Void in
            let alert = UIAlertController(title: "許可されませんでした", message: "Privacy->App->Reminderで変更してください", preferredStyle: UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
            
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
            self.access.allowAuthorization()
        })
    }
}


extension HomeViewController{
}







