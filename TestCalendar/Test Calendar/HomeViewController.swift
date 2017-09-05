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
            calendar.selectionMode = .single(style: .circle)
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

    
    override func loadView() {
        super.loadView()
        self.view.addSubview(statusBar())
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    }
    func koyomi(_ koyomi: Koyomi, currentDateString dateString: String) {
        print("tttttttt")
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
