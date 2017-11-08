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
    
    override func loadView() {
        super.loadView()
        self.view.addSubview(statusBar())
        amButton.setTitle("AM", for: .normal)
        pmButton.setTitle("PM", for: .normal)
        changeWatchButtonType(am: amButton, pm: pmButton, type: .pm)
        getData()
        setData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


// MARK: - Action
extension ShowSubjectViewController{

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
}


// MARK: - Private function
extension ShowSubjectViewController{
    
    /// 初期値に設定してある名前と開始時刻から種類ごとに情報を取得し、その情報をeventに入れる。
    ///
    /// testは終了時刻を１時間後に設定して代入している。
    func getData(){
        let predicate = NSPredicate(format: "name == %@ AND startTime == %@", "\(event.name)", event.start)
        let task = model.searchTask(predicate: predicate)
        let study = model.searchStudy(predicate: predicate)
        let test = model.searchTest(predicate: predicate)
        
        if task.isEmpty == false {
            event = OneEvent(name: task[0].name, start: task[0].startTime, end: task[0].endTime, notification: task[0].notification, color: "black")
        }else if study.isEmpty == false {
            event =  OneEvent(name: study[0].name, start: study[0].startTime, end: study[0].endTime, notification: study[0].notification, color: study[0].color)
        }else if test.isEmpty == false {
            var components = DateComponents()
            components.hour = 1
            let endTime = Calendar.current.date(byAdding: components, to: test[0].startTime as Date)! as NSDate
            event = OneEvent(name: test[0].name, start: test[0].startTime, end: endTime, notification: test[0].notification, color: test[0].color)
        }
        print(event)
    }
    
    
    /// 取得したデータを表示する
    func setData(){
        subjectLabel.text = event.name
        time.text = showTime(start: event.start, end: event.end)
        //通知の更新
        collection.reloadData()
        watch.addSchedule(events: [WatchEvent(color: getColor(event.color), start: event.start, end: event.end)])
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
