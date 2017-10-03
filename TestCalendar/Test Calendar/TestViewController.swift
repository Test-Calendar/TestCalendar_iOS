//
//  TestViewController.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/09/28.
//  Copyright © 2017年 山浦功. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    
    let button = BottomButton()
    var colors: [UIColor] = [CalendarColor.redColor(), CalendarColor.orangeColor(), CalendarColor.yellowColor(), CalendarColor.darkGreen(), CalendarColor.green(), CalendarColor.lightGreen(),CalendarColor.darkBlue(), CalendarColor.blue(), CalendarColor.lightBlue(), CalendarColor.darkPurple(), CalendarColor.lightPurple()]
    var colorNames = ["red", "orange", "yellow", "darkGreen", "green", "lightGreen", "darkBlue", "blue", "lightBlue", "darkPuple", "lightPuple"]
    
    var selectedColorNumber = 12
    
    @IBOutlet weak var subjectTextField: UITextField!
    @IBOutlet weak var typeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBAction func typeSelected(_ sender: Any) {
        let selectedIndex = typeSegmentedControl.selectedSegmentIndex
        //ここでデータをselectedIndexにいれる
    }
    
    
    override func loadView() {
        super.loadView()
        self.view.addSubview(statusBar())
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subjectTextField.clearButtonMode = .always
        subjectTextField.returnKeyType = .done
        subjectTextField.delegate = self as UITextFieldDelegate
        button.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


// MARK: - BottomButtonDelegate
extension TestViewController: BottomButtonDelegate, UITextFieldDelegate{
    
    func tapped() {
        print("tapped")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        subjectTextField.resignFirstResponder()
        return true
    }
    
    // クリアボタンが押された時の処理
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        
        print("Clear")
        return true
    }
    
    // テキストフィールドがフォーカスされた時の処理
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("Start")
        return true
    }
    
    // テキストフィールドでの編集が終わろうとするときの処理
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("End")
        print(textField.text!)
        return true
    }
}

extension TestViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        let radius = cell.frame.width * 0.40
        let view = UIView()
        
        view.frame = CGRect(x: 0, y: 0, width: radius * 2, height: radius * 2 )
        view.backgroundColor = colors[indexPath.row]
        if selectedColorNumber == indexPath.row {
            view.layer.borderColor = CalendarColor.black().cgColor
            view.layer.borderWidth = 2.0
        }
        view.layer.cornerRadius = radius
        view.clipsToBounds = true
        cell.addSubview(view)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(colorNames[indexPath.row])
        print(indexPath.row)
        selectedColorNumber = indexPath.row
        collectionView.reloadData()
    }    
}



// MARK: - DatePickerを扱う関数群
extension TestViewController{
    
    /// DatePickerを追加する関数
    func addDatePicker(){
        
//        let index = stack.arrangedSubviews.count - 1
//        let addView = stack.arrangedSubviews[index]
//        let scroll = scrollView
//        let offset = CGPoint(x: (scroll?.contentOffset.x)!, y: (scroll?.contentOffset.y)! + addView.frame.height)
//        let newView = UIView() //DatePickerを作る
//        
//        newView.isHidden = true
//        stack.insertArrangedSubview(newView, at: index)
//        UIView.animate(withDuration: 0.25) {
//            newView.isHidden = true
//            scroll?.contentOffset = offset
//        }
    }
    
    /// DatePickerを閉じる関数
    func deleteDatePicker(){
        
    }
    
//    private func createPicker(type: Int) -> UIStackView{
        
        //pickerを作成
//        let picker = UIDatePicker()
//        let width = stack.frame.width
//        let height = stack.frame.height
//        let positionX = stack.frame.origin.x
//        let positionY = stack.frame.origin.y - height
//        
//        picker.backgroundColor = .white
//        picker.frame = CGRect(x: positionX, y: positionY, width: width, height: height)
//        
//        if type == 0 {
//            picker.addTarget(self, action: #selector(TestViewController.changeDate(sender:)), for: .valueChanged)
//        }else {
//            picker.addTarget(self, action: #selector(TestViewController.changeDate), for: .valueChanged)
//        }
//        
//        //stackViewを作成してpickerを追加
//        let newStack = UIStackView()
//        newStack.axis = .horizontal
//        newStack.alignment = .firstBaseline
//        newStack.distribution = .fill
//        newStack.spacing = 8
//        newStack.addArrangedSubview(picker)
//        return newStack
    
    /// DatePickerで時刻を変更した時にlabelの変更をする関数
    ///
    /// - Parameter sender: DatePicker
    func changeDate(sender: UIDatePicker){
        let formatter = DateFormatter()
        formatter.setTemplate(.full)
        dateLabel.text = formatter.string(from: sender.date)
        print("changedate")
    }
    
    /// DatePickerで何時間勉強するのかを変えた時にLabelを変更する関数
    ///
    /// - Parameter sender: DatePicker
    func changeTime(sender: UIDatePicker){
        let formatter = DateFormatter()
        formatter.setTemplate(.onlyHour)
        hourLabel.text = formatter.string(from: sender.date)
        print("changeTime")
        
    }
}


