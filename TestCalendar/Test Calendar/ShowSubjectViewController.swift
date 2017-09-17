//
//  ShowSubjectViewController.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/08/31.
//  Copyright © 2017年 山浦功. All rights reserved.
//

import UIKit


struct oneEvent{
    var name: String
    var start: NSDate
    var end: NSDate
    var notification: Bool
    var color: String
}


class ShowSubjectViewController: UIViewController {

    var event: oneEvent!
    var model = CalendarModel.sharedInstance
    var colors: [UIColor] = [CalendarColor.redColor(), CalendarColor.orangeColor(), CalendarColor.yellowColor(), CalendarColor.darkGreen(), CalendarColor.green(), CalendarColor.lightGreen(),CalendarColor.darkBlue(), CalendarColor.blue(), CalendarColor.lightBlue(), CalendarColor.darkPurple(), CalendarColor.lightPurple()]

//    var color = UIColor()
//    var data = Study()
    
    
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var watch: WatchView!
    @IBOutlet weak var amButton: WatchButton!
    @IBOutlet weak var pmButton: WatchButton!
    
    
    @IBAction func changeToAM(_ sender: Any) {
        watch.changeAmPm()
        changeWatchButtonType(am: amButton, pm: pmButton, type: .am)
    }
    
    @IBAction func changeToPM(_ sender: Any) {
        watch.changeAmPm()
        changeWatchButtonType(am: amButton, pm: pmButton, type: .pm)
    }
    
    
    override func loadView() {
        super.loadView()
        self.view.addSubview(statusBar())
        getData()
        setData()
        
        time.text = showTime(start: data.startTime, end: data.endTime)
        
        watch.addSchedule(events: WatchEvent(color: event.color, start: event.start, end: event.end))
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
        //データを検索して探す
        let predicate = NSPredicate(format: "startTime == %@", "\(event.start as Date)")
        
        model.tasks = model.searchTask(predicate: predicate)
        model.studies = model.searchStudy(predicate: predicate)
        model.tests = model.searchTest(predicate: predicate)
        //データをeventに入れる
        
        event.notification = model.tasks[0].notification
        event.notification = model.studies[0].notification
        event.notification = model.tests[0].notification
    }
    
    func setData(){
            }
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
