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
    let weekArray = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]

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
    }
    
    @IBAction func tappedNextButton(_ sender: Any) {
    }
}


// MARK: - Action
extension CalendarViewController{
    
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
        let labelColor:UIColor!
        
        //日付の色を決める
        if(indexPath.row % 7 == 0){
            labelColor = UIColor.red
        } else if(indexPath.row % 7 == 6){
            labelColor = UIColor.blue
        } else {
            labelColor = UIColor.black
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
}
