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
    
    @IBAction func dateSelected(_ sender: Any) {
        let formatter = DateFormatter()
        formatter.setTemplate(.full)
        dateLabel.text = formatter.string(from: (sender as AnyObject).date)
    }
    
    
    @IBAction func typeSelected(_ sender: Any) {
        let selectedIndex = typeSegmentedControl.selectedSegmentIndex
        print(typeSegmentedControl.titleForSegment(at: selectedIndex)!)
        //ここでデータをselectedIndexにいれる
    }
    
    override func loadView() {
        super.loadView()
        self.view.addSubview(statusBar())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subjectTextField.clearButtonMode = .always
        subjectTextField.returnKeyType = .done
        subjectTextField.delegate = self as UITextFieldDelegate
        button.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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


// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
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
        hourLabel.text = "\(row + 1)" + "時間"
    }
}
