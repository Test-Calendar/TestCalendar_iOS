//
//  ShowDayViewController.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/08/31.
//  Copyright © 2017年 山浦功. All rights reserved.
//

import UIKit

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
    
    
    @IBAction func showYesterDay(_ sender: Any) {
        date = getYesterDay(date: date)
        dateLabel.text = showDate(date: date)
        events = loadData(date:date)
        watch.reloadInputViews()
        table.reloadData()
    }
    
    @IBAction func showTomorrow(_ sender: Any) {
        date = getTomorrow(date: date)
        dateLabel.text = showDate(date: date)
        events = loadData(date:date)
        watch.reloadInputViews()
        table.reloadData()
    }
    
    @IBAction func showAm(_ sender: Any) {
        watch.changeAmPm()
    }
    
    @IBAction func showPm(_ sender: Any) {
        watch.changeAmPm()
    }
    
    
    override func loadView() {
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




extension ShowDayViewController{
    
    func showDate(date: NSDate) -> String{
        let formatter = DateFormatter()
        formatter.setTemplate(.date)
        return formatter.string(from: date as Date)
    }
    
    func getYesterDay(date: NSDate) -> NSDate{
        return NSDate(timeInterval: 60*60*24*1, since: date as Date)
    }
    
    func getTomorrow(date: NSDate) -> NSDate{
        return NSDate(timeInterval: -60*60*24*1, since: date as Date)
    }
    
    func loadData(date: NSDate) -> [oneDayEvent]{
        
        let predicate = NSPredicate(format: "startTime = %@", "\(date)")
        
        model.tasks = model.searchTask(predicate: predicate)
        model.studies = model.searchStudy(predicate: predicate)
        model.tests = model.searchTest(predicate: predicate)
        
        for i in model.tasks{
            events.append(oneDayEvent(name: i.name, start: i.startTime, end: i.endTime, color: "black"))
        }
        for i in model.studies{
            events.append(oneDayEvent(name: i.name, start: i.startTime, end: i.endTime, color: i.color))
        }
        for i in model.tests{
            events.append(oneDayEvent(name: i.name, start: i.startTime, end: i.startTime, color: i.color))
        }
        
        events.sort{
            $0.start.timeIntervalSince1970 < $1.start.timeIntervalSince1970
        }
        
        return events
    }
}



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
