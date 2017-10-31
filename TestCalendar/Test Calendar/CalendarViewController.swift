//
//  CalendarViewController.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/10/27.
//  Copyright © 2017年 山浦功. All rights reserved.
//

import UIKit


class CalendarViewController: UIViewController {
    
    
    let dataManager = CalendarViewManager()
    var data = [CalendarViewModel]()
    var selectedDate = NSDate()
    var today: NSDate!
    let cellMargin: CGFloat = 2.0
    let weekArray = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]

    @IBOutlet weak var headerTitle: UILabel!
    @IBOutlet weak var collection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data = dataManager.getData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func tappedPrevButton(_ sender: Any) {
        selectedDate = dataManager.prevMonth(date: selectedDate)
        collection.reloadData()
        headerTitle.text = changeHeaderTitle(date: selectedDate)
    }
    
    @IBAction func tappedNextButton(_ sender: Any) {
        selectedDate = dataManager.nextMonth(date: selectedDate)
        collection.reloadData()
        headerTitle.text = changeHeaderTitle(date: selectedDate)
    }
}


// MARK: - Action
extension CalendarViewController{
    //headerの月を変更
    func changeHeaderTitle(date: NSDate) -> String {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "M/yyyy"
        let selectMonth = formatter.string(from: date as Date)
        return selectMonth
    }
}


// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension CalendarViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 7
        }else {
            return dataManager.daysAquisition()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var labelColor = UIColor.black
        
        //日付の色を決める
        if(indexPath.row % 7 == 0){
            labelColor = UIColor.red
        } else if(indexPath.row % 7 == 6){
            labelColor = UIColor.blue
        }
        //cellに日付を表示
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "header", for: indexPath) as! HeaderCollectionViewCell
            cell.dayLabel.textColor = labelColor
            cell.dayLabel.text = weekArray[indexPath.row]
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CalendarCell
            cell.dayLabel.text = dataManager.conversionDateFormat(indexPath: indexPath)
            return cell
        }
    }
    
    //セルの垂直方向のマージンを設定
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return cellMargin
    }
    
    //セルの水平方向のマージンを設定
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return cellMargin
    }
}
