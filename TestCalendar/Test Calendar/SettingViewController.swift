

//  SettingViewController.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/08/31.
//  Copyright © 2017年 山浦功. All rights reserved.
//

import UIKit
import MaterialComponents

//enum SettingCell {
//    case morning
//    case moringPicker
//    case before
//    case beforePicker
//}

class SettingViewController: UIViewController{
    
//    var cellsType: [UITableViewCell] = [TitleTableViewCell, PickerTableViewCell, TitleTableViewCell, PickerTableViewCell, ButtonTableViewCell]
    var notification: Bool! //
    var morning: Date! //
    var before: Int!//
    var model = CalendarModel.sharedInstance

    @IBOutlet weak var header: UIView!
    @IBOutlet weak var settingTitle: UILabel!
    @IBOutlet weak var notificationLabel: UILabel!
    @IBOutlet weak var morningLabel: UILabel!
    @IBOutlet weak var beforeLabel: UILabel!
    @IBOutlet weak var shareLabel: UILabel!
    @IBOutlet weak var makeButton: ProcessButton!
    
    
    
    // 戻るボタンの設定
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    // 朝の通知時間を設定
    @IBAction func morningSelected(_ sender: Any) {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm"
        morning = (sender as AnyObject).date
    }
    
    
//    //　勉強前の通知時間を設置
//    @IBAction func beforeSelected(_ sender: Any) {
//        let formatter = DateFormatter()
//        formatter.setTemplate(.full)
//        before = (sender as AnyObject).date
//        beforeLabel.text = formatter.string(from: (sender as AnyObject).date!!)
//    }
    
    // 朝の通知のon/offを切り替える
    @IBAction func morningNotificationSelected(_ sender: Any) {
        if (sender as AnyObject).isOn == true{
            notification = true
        }
        if (sender as AnyObject).isOn == false{
            notification = false
        }
    }
    
    // 勉強前の通知のon/offを切り替える
    @IBAction func beforeNotificationSelected(_ sender: Any) {
        if (sender as AnyObject).isOn == true{
            notification = true
        }
        if (sender as AnyObject).isOn == false{
            notification = false
        }
    }
    
    
    override func loadView() {
        super.loadView()
        self.view.addSubview(statusBar())
        makeButton.setTitle("iOSカレンダーと共有", for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeButton.delegate = self as ProcessButtonDelegate
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension SettingViewController: ProcessButtonDelegate{
    
    /// 作成ボタンが押された時の処理
    func tapped() {
        if let url = URL(string:"App-Prefs:root=NOTIFICATIONS_ID") {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }

        }
    }
}

extension SettingViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 60
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row + 1)"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        before = (row + 1)
    }
}


// MARK: - <#UITableViewDataSource, UITableViewDelegate#>
//extension SettingViewController: UITableViewDataSource, UITableViewDelegate{
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: )
////        if indexPath.section == 0{
////                let cell = tableView.dequeueReusableCell(withIdentifier: "title") as! CellType[indexPath.row]
////                cell.updateCell(count: 0)//ここでデータを入れる
////                return cell
////
////            case 1:
////                let cell = tableView.dequeueReusableCell(withIdentifier: "timePicker") as! PickerTableViewCell
////                cell.updateCell(num: 1)//ここでデータを入れる
////                return cell
////
////            case 2:
////                let cell = tableView.dequeueReusableCell(withIdentifier: "title") as! TitleTableViewCell
////                cell.updateCell(count: 1)//ここでデータを入れる
////                return cell
////
////            case 3:
////                let cell = tableView.dequeueReusableCell(withIdentifier: "timePicker") as! PickerTableViewCell
////                cell.updateCell(num: 1)//ここでデータを入れる
////                return cell
////            default: break
////            }
////        } else {
////            let cell = tableView.dequeueReusableCell(withIdentifier: "makeButton") as! ButtonTableViewCell
////            cell.updateCell()
////            return cell
////        }
////    }
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 2
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if section == 0 {
//            return 4
//        }else {
//            return 1
//        }
//    }
//
//    //セクションのタイトルを返す.
//    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return Sections[section] as? String
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        //せるが選択された時の挙動
//
//
//    }
//
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath:     NSIndexPath) -> UITableViewCell {
//        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Cell")
//
//        return cell
//    }
//}
//
//
//
////
////
////
////
////
////
////
////    override func didReceiveMemoryWarning() {
////        super.didReceiveMemoryWarning()
////        // Dispose of any resources that can be recreated.
////    }
////
//
//////extension SettingViewController: UITableViewDelegate, UITableViewDataSource{
//////
//////    // Table Viewのセルの数を指定
//////    func tableView(_ table: UITableView, numberOfRowsInSection section: Int) -> Int {
//////        if section == 0 {
//////            return 4
//////        }
//////        else if section == 1 {
//////            return 1
//////        }
//////        else{
//////            return 0
//////        }
//////    }
//////
//////    // セクションのタイトルを返す.
//////    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//////        return sectionTitle[section] as! String
//////    }
//////
//////    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//////
//////        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
//////
//////        if indexPath.section == 0 {
//////            cell.textLabel?.text = "\(Array1[indexPath.row])"
//////        } else if indexPath.section == 1 {
//////            cell.textLabel?.text = "\(Array2[indexPath.row])"
//////        }
//////
//////        return cell
//////    }
//////
//////
//////    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//////        return sectionTitle.count
//////    }
//////
//////    func hasPickerForIndexPath(_ indexPath: IndexPath) -> Bool {
//////        var hasDatePicker = false
//////
//////        let targetedRow = indexPath.row + 1
//////
//////        let checkDatePickerCell = self.tableView.cellForRow(at: IndexPath(row: targetedRow, section: 0))
//////        let checkDatePicker = checkDatePickerCell?.viewWithTag(kDatePickerTag)
//////
//////        hasDatePicker = checkDatePicker != nil
//////        return hasDatePicker
//////    }
//////
//////
//////    // morningの時間設定
//////    @IBAction func mChangeDate(_ sender: Any) {
//////
//////    var targetedCellIndexPath: IndexPath?
//////
//////    if self.hasInlineDatePicker() {
//////    // inline date picker: update the cell's date "above" the date picker cell
//////    //
//////        targetedCellIndexPath = IndexPath(row: hasPickerForIndexPath.row - 1, section: 0)
//////    } else {
//////    // external date picker: update the current "selected" cell's date
//////    targetedCellIndexPath = self.tableView.indexPathForSelectedRow!
//////    }
//////
//////    let cell = self.tableView.cellForRow(at: targetedCellIndexPath!)
//////    let targetedDatePicker = sender
//////
//////    // update our data model
//////    var itemData = dataArray[targetedCellIndexPath!.row]
//////        itemData[kDateKey] = (targetedDatePicker as AnyObject).date as AnyObject
//////    dataArray[targetedCellIndexPath!.row] = itemData
//////
//////    // update the cell's date string
//////        cell?.detailTextLabel?.text = DateFormatter.string(from: targetedDatePicker.date)
//////    }
//////}
////
////
