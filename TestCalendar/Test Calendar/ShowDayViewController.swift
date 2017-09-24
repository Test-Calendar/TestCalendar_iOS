//
//  ShowDayViewController.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/08/31.
//  Copyright © 2017年 山浦功. All rights reserved.
//


import UIKit



/// 1日表示に利用するデータの構造体
struct oneDayEvent{
    var name: String
    var start: NSDate
    var end: NSDate
    var color: String
}


class ShowDayViewController: UIViewController {
    
    var date = NSDate()
    var events = [oneDayEvent]()
    var model = CalendarModel.sharedInstance
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var watch: WatchView!
    @IBOutlet weak var amButton: WatchButton!
    @IBOutlet weak var pmButton: WatchButton!
    
    
    @IBAction func showYesterDay(_ sender: Any) {
        date = getYesterDay(date: date)
        dateLabel.text = showDate(date: date)
//        events = loadData(date:date)
        watch.reloadInputViews()
//        table.reloadData()
    }
    
    @IBAction func showTomorrow(_ sender: Any) {
        date = getTomorrow(date: date)
        dateLabel.text = showDate(date: date)
//        events = loadData(date: date)
        print("tomorrow")
//        table.reloadData()
    }
    
    @IBAction func showAm(_ sender: Any) {
        watch.changeAmPm()
        changeWatchButtonType(am: amButton, pm: pmButton, type: .am)
    }
    
    @IBAction func showPm(_ sender: Any) {
        watch.changeAmPm()
        changeWatchButtonType(am: amButton, pm: pmButton, type: .pm)
    }
    
    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func loadView() {
        super.loadView()
        amButton.setTitle("AM", for: .normal)
        pmButton.setTitle("PM", for: .normal)
        changeWatchButtonType(am: amButton, pm: pmButton, type: .pm)
        self.view.addSubview(statusBar())
        dateLabel.text = showDate(date: date)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}



// MARK: - UITableViewDelegate, UITableViewDataSource
extension ShowDayViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ShowDayTableViewCell
        
        cell.colorView.backgroundColor = getColor(color: events[indexPath.row].color)
        cell.subjectLabel.text = events[indexPath.row].name
        cell.timeLabel.text = showTime(start: events[indexPath.row].start, end: events[indexPath.row].end)
        
        return cell
    }
}



// MARK: - このクラスで利用する関数
extension ShowDayViewController{
    
    /// 表示している日付をUILabelに表示する関数
    ///
    /// - Parameter date: 表示したい日付を代入
    /// - Returns: 表示する日付を返す
    func showDate(date: NSDate) -> String{
        let formatter = DateFormatter()
        formatter.setTemplate(.date)
        return formatter.string(from: date as Date)
    }
    
    /// 前の日付を返す関数
    ///
    /// - Parameter date: 使用中の日付
    /// - Returns: 前の日の日付
    func getYesterDay(date: NSDate) -> NSDate{
        return NSDate(timeInterval: -60*60*24*1, since: date as Date)
    }
    
    
    /// 次の日付を返す関数
    ///
    /// - Parameter date: 使用中の日付
    /// - Returns: 与えられた次の日の日付
    func getTomorrow(date: NSDate) -> NSDate{
        return NSDate(timeInterval: 60*60*24*1, since: date as Date)
    }
    
    
    /// 表示に用いるデータの取得
    ///
    /// - Parameter date: 取得したいデータの日付
    /// - Returns: 取得したデータ時間順に並べたもの
    func loadData(date: NSDate) -> [oneDayEvent]{
        
        let predicate = NSPredicate(format: "startTime = %@", "\(date)")
        let tasks = model.searchTask(predicate: predicate)
        let studies = model.searchStudy(predicate: predicate)
        let tests = model.searchTest(predicate: predicate)
        
        if tasks.isEmpty == false{
            for i in tasks{
                events.append(oneDayEvent(name: i.name, start: i.startTime, end: i.endTime, color: "black"))
            }
        }
        if studies.isEmpty == false{
            for i in studies{
                events.append(oneDayEvent(name: i.name, start: i.startTime, end: i.endTime, color: i.color))
            }
        }
        if tests.isEmpty == false{
            for i in model.tests{
                events.append(oneDayEvent(name: i.name, start: i.startTime, end: i.startTime, color: i.color))
            }
        }
        
        events.sort{
            $0.start.timeIntervalSince1970 < $1.start.timeIntervalSince1970
        }
        return events
    }
}





