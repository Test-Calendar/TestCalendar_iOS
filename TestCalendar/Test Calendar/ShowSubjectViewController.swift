//
//  ShowSubjectViewController.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/08/31.
//  Copyright © 2017年 山浦功. All rights reserved.
//

import UIKit

class ShowSubjectViewController: UIViewController {

    var date = Date()
    var events = [oneEvent]()
    var model = CalendarModel.sharedInstance
    var colors: [UIColor] = [CalendarColor.redColor(), CalendarColor.orangeColor(), CalendarColor.yellowColor(), CalendarColor.darkGreen(), CalendarColor.green(), CalendarColor.lightGreen(),CalendarColor.darkBlue(), CalendarColor.blue(), CalendarColor.lightBlue(), CalendarColor.darkPurple(), CalendarColor.lightPurple()]

//    var color = UIColor()
//    var data = Study()
    
    
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var watch: WatchView!
    
    
    @IBAction func changeToAM(_ sender: Any) {
        watch.changeAmPm()
        //changeButtonColor
    }
    
    @IBAction func changeToPM(_ sender: Any) {
    }
    
    
    override func loadView() {
        super.loadView()
        self.view.addSubview(statusBar())
        getData()
        setData()
        
        //time.text = showTime(start: data.startTime, end: data.endTime)
        //ボタンのオンオフの更新
        
        watch.addSchedule()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}



extension ShowSubjectViewController{
    
    
    func getData(){
        
        
        let predicate = NSPredicate(format: "startTime = %@", "\(date as NSDate)")
        
        model.tasks = model.searchTask(predicate: predicate)
        model.studies = model.searchStudy(predicate: predicate)
        model.tests = model.searchTest(predicate: predicate)
        
        
        for i in model.tasks{
            events.append(oneEvent(name: i.name, start: i.startTime as Date, end: i.endTime as Date, notification: i.notification, color: "test"))
        }
        for i in model.studies{
            events.append(oneEvent(name: i.name, start: i.startTime as Date, end: i.endTime as Date, notification: i.notification, color: i.color))
        }
        for i in model.tests{
            events.append(oneEvent(name: i.name, start: i.startTime as Date, end: i.startTime as Date, notification: i.notification, color: i.color))
        }

    }
    
    func setData(){
            }
}


struct oneEvent{
    var name: String
    var start: Date
    var end: Date
    var notification: Bool
    var color: String
}




extension ShowSubjectViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //色情報を変える。もし他にあれば切り替えしていいかのダイアログを表示
        
        collectionView.reloadData() //色の更新
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count //色の数
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        let radius = cell.frame.width * 0.40
        let view = UIView()
        
        view.frame = CGRect(x: 0, y: 0, width: radius * 2, height: radius * 2 )
        view.backgroundColor = colors[indexPath.row]
//        if color == colors[indexPath.row] {
//            view.layer.borderColor = CalendarColor.black().cgColor
//            view.layer.borderWidth = 2.0
//        }
        view.layer.cornerRadius = radius
        view.clipsToBounds = true
        cell.addSubview(view)
        return cell
    }
}




func getColor(color: String) -> UIColor{
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
