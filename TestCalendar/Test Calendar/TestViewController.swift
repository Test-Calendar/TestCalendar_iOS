//
//  TestViewController.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/09/28.
//  Copyright © 2017年 山浦功. All rights reserved.
//

import UIKit


class TestViewController: UIViewController {
    
    var data: TestListViewModel!
    var presenter: AddTestPresenter?
    var selectedColorNumber: Int? //色
    let model = CalendarModel.sharedInstance
    
    @IBOutlet weak var subjectTextField: UITextField!
    @IBOutlet weak var typeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var makeButton: ProcessButton!
    @IBOutlet weak var notification: UISwitch!
    
    
    @IBAction func dateSelected(_ sender: Any) { //開始時刻が選択
        let formatter = DateFormatter()
        formatter.setTemplate(.full)
        data?.time = (sender as AnyObject).date as NSDate
        dateLabel.text = formatter.string(from: (sender as AnyObject).date!!)
    }
   
    @IBAction func notificationSelected(_ sender: Any) { //通知のon/Offを切り替える
        if (sender as AnyObject).isOn == true{
            data?.notification = true
        }
        if (sender as AnyObject).isOn == false{
            data?.notification = false
        }
    }
    
    
    override func loadView() {
        super.loadView()
        self.view.addSubview(statusBar())
        makeButton.setTitle("作成", for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextField()
        setUpData()
        makeButton.delegate = self as ProcessButtonDelegate
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


// MARK: - ProcessButtonDelegate
extension TestViewController: ProcessButtonDelegate{
    
    /// 作成ボタンが押された時の処理
    func tapped() {
        
        //データがあるかどうかを確認
        var check = 0
        
        if selectedColorNumber != nil { check += 1 }
//        if data?.notification != nil { check += 1 }
        if subjectTextField.text! != "" { check += 1 }
        if data?.study != 0 { check += 1 }
//        if data?.time != nil { check += 1 }
        
        if check == 3{
            let test = model.createTest()
            data.name = subjectTextField.text!
            test.name = data.name
            test.type = data.type
            test.color = data.color
            test.notification = data.notification
            test.studyHour = data.study
            test.startTime = data.time
            model.save(object: test)
            let next = TestListViewController()
            next.status = .update
            self.dismiss(animated: true, completion: nil)
        }else {
            showAlert()
        }
        
    }
}


// MARK: - Private
extension TestViewController{
    
    fileprivate func setUpData(){
        subjectTextField.text = data.name
        typeSegmentedControl.isSelected = true
        for i in 0 ... 10 {
            if colorNames[i] == data.color {
                selectedColorNumber = i
                self.collection.reloadData()
            }
        }
        if data.notification == true {
            notification.isSelected = true
        }
        hourLabel.text = "\(data.study)" + "時間"
        let formatter = DateFormatter()
        formatter.setTemplate(.full)
        dateLabel.text = formatter.string(from: data.time as Date)
    }
    
    fileprivate func showAlert(){
        let alert = UIAlertController(title: "入力エラー", message: "すべての項目に記入しているかを確認して下さい", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}


// MARK: - UITextFieldDelegate  タイトルを入力する時の画面
extension TestViewController: UITextFieldDelegate{
    
    func setTextField(){
        subjectTextField.clearButtonMode = .always
        subjectTextField.returnKeyType = .done
        subjectTextField.delegate = self as UITextFieldDelegate
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        data.name = subjectTextField.text!
        subjectTextField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
}


// MARK: - UICollectionViewDelegate, UICollectionViewDataSource 色を選ぶ時のcollectionview
extension TestViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ColorCollectionViewCell
        if selectedColorNumber == indexPath.row {
            cell.updateCell(indexPath.row, select: true)
        } else {
            cell.updateCell(indexPath.row, select: false)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count //色の数を返す
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedColorNumber = indexPath.row
        data.color = colorNames[selectedColorNumber!]
        collectionView.reloadData()
    }    
}


// MARK: - UIPickerViewDelegate, UIPickerViewDataSource  勉強時間を選択
extension TestViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 50
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row + 1)"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        data?.study = (row + 1)
        hourLabel.text = "\(row + 1)" + "時間"
    }
}
