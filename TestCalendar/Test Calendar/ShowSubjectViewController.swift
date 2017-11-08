//
//  ShowSubjectViewController.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/08/31.
//  Copyright © 2017年 山浦功. All rights reserved.
//

import UIKit


struct OneEvent{
    var name: String
    var start: NSDate
    var end: NSDate
    var notification: Bool
    var color: String
}


class ShowSubjectViewController: UIViewController {

    var event = OneEvent(name: "", start: NSDate(), end: NSDate(), notification: false, color: "black")
    var model = CalendarModel.sharedInstance
    var colors: [UIColor] = [CalendarColor.redColor(), CalendarColor.orangeColor(), CalendarColor.yellowColor(), CalendarColor.darkGreen(), CalendarColor.green(), CalendarColor.lightGreen(),CalendarColor.darkBlue(), CalendarColor.blue(), CalendarColor.lightBlue(), CalendarColor.darkPurple(), CalendarColor.lightPurple()]
    
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var watch: WatchView!
    @IBOutlet weak var amButton: WatchButton!
    @IBOutlet weak var pmButton: WatchButton!
    @IBOutlet weak var collection: UICollectionView!
    
    
    @IBAction func changeToAM(_ sender: Any) {
        watch.changeAmPm()
        changeWatchButtonType(am: amButton, pm: pmButton, type: .am)
    }
    
    @IBAction func changeToPM(_ sender: Any) {
        watch.changeAmPm()
        changeWatchButtonType(am: amButton, pm: pmButton, type: .pm)
    }
    
    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func loadView() {
        super.loadView()
        self.view.addSubview(statusBar())
        getData() //足りないデータの取得
        setData() //データを使って表示を更新
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}



// MARK: - UICollectionViewDelegate,UICollectionViewDataSource
extension ShowSubjectViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if colors[indexPath.row] != getColor(event.color){
            //色を変えるのかダイアログの表示
            //色の入れ替えができるか検討
            //他に使われてたら変更するかダイアログを表示
        }
        collection.reloadData() //表示の更新
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
        if getColor(event.color) == colors[indexPath.row] {
            view.layer.borderColor = CalendarColor.black().cgColor
            view.layer.borderWidth = 2.0
        }
        view.layer.cornerRadius = radius
        view.clipsToBounds = true
        cell.addSubview(view)
        return cell
    }
}


extension ShowSubjectViewController{
    
    func getData(){
        let predicate = NSPredicate(format: "name == %@ AND startTime == %@", "\(event.name)", event.start)
        let task = model.searchTask(predicate: predicate)
        let study = model.searchStudy(predicate: predicate)
        let test = model.searchTest(predicate: predicate)
        
        if task.isEmpty == false {
            event.notification = model.tasks[0].notification
        }else if study.isEmpty == false {
            event.notification = model.studies[0].notification
        }else if test.isEmpty == false {
            event.notification = model.tests[0].notification
        }
    }
    
    func setData(){
        subjectLabel.text = event.name
        time.text = showTime(start: event.start, end: event.end)
        //通知の更新
        collection.reloadData()
        watch.addSchedule(events: [WatchEvent(color: getColor(event.color), start: event.start, end: event.end)])
    }
}
