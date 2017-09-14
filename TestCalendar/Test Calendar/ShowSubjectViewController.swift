//
//  ShowSubjectViewController.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/08/31.
//  Copyright © 2017年 山浦功. All rights reserved.
//

import UIKit

class ShowSubjectViewController: UIViewController {

    var colors: [UIColor] = [CalendarColor.redColor(), CalendarColor.orangeColor(), CalendarColor.yellowColor(), CalendarColor.darkGreen(), CalendarColor.green(), CalendarColor.lightGreen(),CalendarColor.darkBlue(), CalendarColor.blue(), CalendarColor.lightBlue(), CalendarColor.darkPurple(), CalendarColor.lightPurple()]

    var color = UIColor()
    var model = CalendarModel.sharedInstance
    var data = Study()
    
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var watch: WatchView!
    
    override func loadView() {
        super.loadView()
        self.view.addSubview(statusBar())
        time.text = showTime(start: data.startTime, end: data.endTime)
        //ボタンのオンオフの更新
        
        watch.addSubject()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
/*        if color == colors[indexPath.row] {
            view.layer.borderColor = CalendarColor.black().cgColor
            view.layer.borderWidth = 2.0
        } */
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
    default: return CalendarColor.black()
    }
}


func showTime(start: NSDate, end: NSDate)-> String{
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm"
    let startTime = formatter.string(from: start as Date)
    let endTime = formatter.string(from: end as Date)
    return startTime + " ~ " + endTime
}
