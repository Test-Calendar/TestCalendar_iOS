//
//  AddTestViewController.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/08/31.
//  Copyright © 2017年 山浦功. All rights reserved.
//


import Foundation
import UIKit
import MaterialComponents

enum CellType {
    case subject
    case select
    case color
    case notification
    case study
    case studyPicker
    case start
    case startPicker
}


class AddTestViewController: UIViewController{
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func loadView() {
        super.loadView()
        self.view.addSubview(statusBar())
        setButton()
    }
    
    func flatButtonDidTap(_ sender: UIButton){
        let SetTimeViewController = self.storyboard!.instantiateViewController( withIdentifier: "SetTime" ) as! SetTimeViewController
        performSegue(withIdentifier: "SetTimeViewController", sender: nil)
        self.present(SetTimeViewController, animated: true, completion: nil)
    }
    
    func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        // キーボードを閉じる
        self.view.endEditing(true)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
//
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//    
//
//}
//
//    
//    
//    
//
//    
//    
//    
//
//
//    
//
}

extension AddTestViewController{
    func setButton(){
        let flatButton = MDCFlatButton()
        flatButton.customTitleColor = UIColor.red
        flatButton.setTitle("Flat Button", for: .normal)
        flatButton.sizeToFit()
        flatButton.addTarget(self, action: #selector(AddTestViewController.flatButtonDidTap(_:)), for: .touchUpInside)
        
        
        // ボタンのサイズ.
        let bWidth: CGFloat = 347
        let bHeight: CGFloat = 46
        
        // ボタンのX,Y座標.
        let posX: CGFloat = self.view.frame.width/2 - bWidth/2
        let posY: CGFloat = self.view.frame.height - bHeight - 30 - 12
        
        // ボタンの設置座標とサイズを設定する.
        flatButton.frame = CGRect(x: posX, y: posY, width: bWidth, height: bHeight)
        
        // ボタンの背景色を設定.
        flatButton.setBackgroundColor(UIColor.red, for: .normal)
        
        // タイトルを設定する(通常時).
        flatButton.setTitle("次へ", for: .normal)
        flatButton.setTitleColor(UIColor.white, for: .normal)
        
        // ボタンにタグをつける.
        flatButton.tag = 1
        
        // ボタンをViewに追加.
        self.view.addSubview(flatButton)
        
    }
}



class AddDetailViewController: UITableView{
    var pickerIndexPath: IndexPath!
    let studyPicker = ["1"]
    
    
    var datePickerIndexPath: IndexPath?
    var dateFormatter = DateFormatter()
    
    let cellCount  = 6
    let kDatePickerTag = 99
    let subjectCellID = "subjectCell"
    let selectCellID = "selectCell"
    let colorCellID = "colorCell"
    let notificationCellID = "notifiicationCell"
    let studyCellID = "studyCell"
    let studyPickerCellID = "studyPickerCell"
    let startCellID = "startCell"
    let startPickerCellID = "startPickerCell"
    
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet weak var subjectName: UITextField!
    @IBOutlet weak var selectType: UISegmentedControl!
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var notificationLabel: UILabel!
    @IBOutlet weak var studyTitleLabel: UILabel!
    @IBOutlet weak var studyTimeLabel: UILabel!
    @IBOutlet weak var studyPickerView: UIPickerView!
    @IBOutlet weak var startTitleLabel: UILabel!
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var startPickerView: UIDatePicker!

}


extension AddDetailViewController: UITableViewDataSource, UIPickerViewDelegate{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
{
        var cell: UITableViewCell?
        var cellID: String!
        
        switch indexPath.row {
        case 0 :
            cellID = subjectCellID
        case 1 :
            cellID = subjectCellID
        case 2 :
            cellID = colorCellID
        case 3 :
            cellID = notificationCellID
        case 4 :
            cellID = studyCellID
            //        case 5 :
        //            cellID = studyPickerCellID
        case 5 :
            cellID = startCellID
            //        case .startPicker :
        //            cellID = startPickerCellID
        default : break
        }
        
        
        
        
        //            if indexPathHasPicker(indexPath) {
        //
        //            cellID = datePickerCellID    //        };else if indexPathHasPicker(indexPath) {
        //            cellID = studyCellID
        //        }else if indexPathHasDate(indexPath) {
        //            // the indexPath is one that contains the date information
        //            cellID = startCellID       // the start/end date cells
        //        }else if indexPathHasDate(indexPath){
        //            cellID = subjectCellID
        //        }else if indexPathHasDate(indexPath){
        //            cellID = selectCellID
        //        }else if indexPathHasDate(indexPath){
        //            cellID = colorCellID
        //        }else if indexPathHasDate(indexPath){
        //            cellID = notificationCellID
        //        }else if indexPathHasDate(indexPath){
        //            cellID = studyCellID
        //        }
        
        
        
        
        cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        
        if indexPath.row == 0 {
            //we decide here that first cell in the table is not selectable (it's just an indicator)
            cell?.selectionStyle = .none;
        }
        
        // if we have a date picker open whose cell is above the cell we want to update,
        // then we have one more cell than the model allows
        //
        var modelRow = indexPath.row
        if (datePickerIndexPath != nil && (datePickerIndexPath?.row)! <= indexPath.row) {
            modelRow -= 1
        }
        
        if cellID == studyCellID {
            // this cell is a non-date cell, just assign it's text label
            studyTimeLabel.text = "勉強時間"
            //studyTimeLabel.text = studyPicker.studyPickerView
            studyTimeLabel.text = String(describing: studyPickerView)
        }else if cellID == startCellID {
            // we have either start or end date cells, populate their date field
            startTitleLabel.text = "テスト開始時刻"
            startTimeLabel.text = dateFormatter.string(from: startPickerView.date)
        }
        
        //else  else if cellID == subjectCellID {
        //            cell?.
        //        }
        
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if hasInlineDatePicker() {
            return cellCount + 1;
        }
        
        return cellCount;
    }
    
    func tableView(_ tableView: UITableView, indexPath: IndexPath)
    {
        let cell = tableView.cellForRow(at: indexPath)
        if cell?.reuseIdentifier == startCellID {
            displayInlineDatePickerForRowAtIndexPath(indexPath)
        } else {
            tableView.deselectRow(at: indexPath, animated: true)
        }
        //else if cell?.reuseIdentifier == colorCellID{
        
        //}
    }
}

extension AddDetailViewController{
    func indexPathHasPicker(_ indexPath: IndexPath) -> Bool {
        return hasInlineDatePicker() && datePickerIndexPath?.row == indexPath.row
    }
        
        func hasInlineDatePicker() -> Bool {
            return datePickerIndexPath != nil
        }
        
        func indexPathHasDate(_ indexPath: IndexPath) -> Bool {
            let hasDate = false
            //
            //        if (indexPath.row == kDateStartRow) || (indexPath.row == kDateEndRow || (hasInlineDatePicker() && (indexPath.row == kDateEndRow + 1))) {
            //            hasDate = true
            //    }
            return hasDate
        }
        
        
        //dateCellが選択された時に動く
        func displayInlineDatePickerForRowAtIndexPath(_ indexPath: IndexPath) {
            
            // display the date picker inline with the table content
            self.tableView.beginUpdates()
            
            var before = false // indicates if the date picker is below "indexPath", help us determine which row to reveal
            if hasInlineDatePicker() {
                before = (datePickerIndexPath?.row)! < indexPath.row
            }
            
            let sameCellClicked = (datePickerIndexPath?.row == indexPath.row + 1)
            
            // remove any date picker cell if it exists
            if self.hasInlineDatePicker() {
                self.tableView.deleteRows(at: [IndexPath(row: datePickerIndexPath!.row, section: 0)], with: .fade)
                datePickerIndexPath = nil
            }
            
            if !sameCellClicked {
                // hide the old date picker and display the new one
                let rowToReveal = (before ? indexPath.row - 1 : indexPath.row)
                let indexPathToReveal = IndexPath(row: rowToReveal, section: 0)
                
                toggleDatePickerForSelectedIndexPath(indexPathToReveal)
                datePickerIndexPath = IndexPath(row: indexPathToReveal.row + 1, section: 0)
            }
            
            // always deselect the row containing the start or end date
            self.tableView.deselectRow(at: indexPath, animated:true)
            
            self.tableView.endUpdates()
            
            // inform our date picker of the current date to match the current cell
            updateDatePicker()
        }
        
        func toggleDatePickerForSelectedIndexPath(_ indexPath: IndexPath) {
            
            self.tableView.beginUpdates()
            
            let indexPaths = [IndexPath(row: indexPath.row + 1, section: 0)]
            
            // check if 'indexPath' has an attached date picker below it
            if (datePickerIndexPath != nil){
                // found a picker below it, so remove it
                self.tableView.deleteRows(at: indexPaths, with: .fade)
            } else {
                // didn't find a picker below it, so we should insert it
                self.tableView.insertRows(at: indexPaths, with: .fade)
            }
            self.tableView.endUpdates()
        }
        
        func hasPickerForIndexPath(_ indexPath: IndexPath) -> Bool {
            var hasDatePicker = false
            
            let targetedRow = indexPath.row + 1
            
            let checkDatePickerCell = self.tableView.cellForRow(at: IndexPath(row: targetedRow, section: 0))
            let checkDatePicker = checkDatePickerCell?.viewWithTag(kDatePickerTag)
            
            hasDatePicker = checkDatePicker != nil
            return hasDatePicker
        }
        
        
        func updateDatePicker() {
            if let indexPath = datePickerIndexPath {
                let associatedDatePickerCell = self.tableView.cellForRow(at: indexPath)
                if (associatedDatePickerCell?.viewWithTag(kDatePickerTag) as! UIDatePicker?) != nil {
                    //datePickerで表示する文字の設定
                    //                let itemData = dataArray[self.datePickerIndexPath!.row - 1]
                    //                targetedDatePicker.setDate(itemData[kDateKey] as! Date, animated: false)
                }
            }
        }
}

class StartCellViewcontroller: AddDetailViewController{
    
}
