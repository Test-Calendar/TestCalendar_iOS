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
    
    @IBOutlet weak var subjectTextField: UITextField!
    @IBOutlet weak var typeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func loadView() {
        super.loadView()
        self.view.addSubview(statusBar())
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


// MARK: - BottomButtonDelegate
extension TestViewController: BottomButtonDelegate{
    
    func tapped() {
        print("tapped")
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


