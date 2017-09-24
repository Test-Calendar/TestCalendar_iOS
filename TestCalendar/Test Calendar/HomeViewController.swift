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
        showSchedules(calendar: calendar, model: model)
        add.delegate = self
        todo.delegate = self
        test.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}




extension HomeViewController: KoyomiDelegate{
    
    func koyomi(_ koyomi: Koyomi, didSelect date: Date?, forItemAt indexPath: IndexPath) {
        print("このセルが選択されました")
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        print(formatter.string(from: date!))
        let storyboard: UIStoryboard = UIStoryboard(name: "ShowDetail", bundle: nil)
        let initalViewController = storyboard.instantiateInitialViewController()
        let viewController = ShowDayViewController()
        viewController.date = date! as NSDate
        present(initalViewController!, animated: true, completion: nil)
//        self.performSegue(withIdentifier: "toShowDayViewController", sender: date! as NSDate)
        //画面を遷移
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
    

    func tapped(type: Bool) {
        if type == true{
            add.type = false
            add.setTitle("x", for: .normal)
            add.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(14))
//            add.titleLabel?.backgroundColor = .white
            self.view.addSubview(todo)
            self.view.addSubview(test)
        }else {
            add.type = true
            add.setTitle("+", for: .normal)
            todo.removeFromSuperview()
            test.removeFromSuperview()
        }
    }
    
    //small
    func tapped(tag: Int) {
        if tag == 1{ //task
            //task 画面遷移
        }else{ //test
            //画面遷移
        }
    }
}

extension HomeViewController{
    
//    func segue(){
//        let storyboard: UIStoryboard =UIStoryboard(name: "ShowDetail", bundle: nil)
//        let nextView = storyboard.instantiateInitialViewController()
//        
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toShowDayViewController" {
//            let storyboard: UIStoryboard = UIStoryboard(name: "AddEvent", bundle: nil)
//            let next = storyboard.instantiateViewController()
//            let secondViewController = segue.destination as! ShowDayViewController
//            secondViewController.date = sender as! NSDate
        }
        if segue.identifier == "toAddEventViewController" {
//            let secondeViewController = segue.destination as! AddEventViewController
//            secondeViewController.date = sender as! NSDate
        }
    }
}







