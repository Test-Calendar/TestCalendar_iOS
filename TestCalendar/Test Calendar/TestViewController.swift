//
//  TestViewController.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/09/28.
//  Copyright © 2017年 山浦功. All rights reserved.
//

import UIKit
import MaterialComponents

//struct TestInfo{
//    var name: String
//    var type: Int
//    var color: String
//    var notification: Bool
//    var study: Int
//    var time: NSDate
//}

var colors: [UIColor] = [CalendarColor.redColor(), CalendarColor.orangeColor(), CalendarColor.yellowColor(), CalendarColor.darkGreen(), CalendarColor.green(), CalendarColor.lightGreen(),CalendarColor.darkBlue(), CalendarColor.blue(), CalendarColor.lightBlue(), CalendarColor.darkPurple(), CalendarColor.lightPurple()]
var colorNames = ["red", "orange", "yellow", "darkGreen", "green", "lightGreen", "darkBlue", "blue", "lightBlue", "darkPuple", "lightPuple"]


class TestViewController: UIViewController {
    
    var selectedColorNumber: Int? //色
    var notification: Bool? //通知
    var study: Int? //勉強時間
    var date: Date? //開始時刻
    var model = CalendarModel.sharedInstance
    
    @IBOutlet weak var subjectTextField: UITextField!
    @IBOutlet weak var typeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var makeButton: ProcessButton!
    
    //開始時刻が選択
    @IBAction func dateSelected(_ sender: Any) {
        let formatter = DateFormatter()
        formatter.setTemplate(.full)
        date = (sender as AnyObject).date
        dateLabel.text = formatter.string(from: (sender as AnyObject).date!!)
    }
   
    //通知のon/Offを切り替える
    @IBAction func notificationSelected(_ sender: Any) {
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
        makeButton.setTitle("作成", for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextField()
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
        if notification != nil { check += 1 }
        if subjectTextField.text! != "" { check += 1 }
        if study != nil { check += 1 }
        if date != nil { check += 1 }
        
        //データの保存
        if check == 5{
            print("データ保存開始")
//            let test = model.createTest()
//            test.name = subjectTextField.text!
//            test.type = typeSegmentedControl.selectedSegmentIndex
//            test.startTime = date! as NSDate
//            test.color = colorNames[selectedColorNumber!]
//            model.save(object: test)
        }else {
            let alert = UIAlertController(title: "入力エラー", message: "すべての項目に記入しているかを確認して下さい", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        
        //画面を遷移する
//        self.dismiss(animated: true, completion: nil)
    }
}


// MARK: - UITextFieldDelegate  タイトルを入力する時の画面
extension TestViewController: UITextFieldDelegate{
    
    /// TextFieldの初期設定
    func setTextField(){
        subjectTextField.clearButtonMode = .always
        subjectTextField.returnKeyType = .done
        subjectTextField.delegate = self as UITextFieldDelegate
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        subjectTextField.resignFirstResponder()
        return true
    }
    
    // クリアボタンが押された時の処理
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
    
    // テキストフィールドがフォーカスされた時の処理
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    // テキストフィールドでの編集が終わろうとするときの処理
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
}


// MARK: - UICollectionViewDelegate, UICollectionViewDataSource 色を選ぶ時のcollectionview
extension TestViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    //cellの生成
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        let radius = cell.frame.width * 0.40
        let view = UIView()
        
        view.frame = CGRect(x: 0, y: 0, width: radius * 2, height: radius * 2 )
        view.backgroundColor = colors[indexPath.row]
        if selectedColorNumber == indexPath.row { //選択された色の場合周りに黒枠をつける
            view.layer.borderColor = CalendarColor.black().cgColor
            view.layer.borderWidth = 2.0
        }
        view.layer.cornerRadius = radius
        view.clipsToBounds = true
        cell.addSubview(view)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count //色の数を返す
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedColorNumber = indexPath.row  //選択された色の番号を保存
        collectionView.reloadData()  //collectionViewのデータを再読み込み
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
        study = (row + 1)
        hourLabel.text = "\(row + 1)" + "時間"
    }
}
