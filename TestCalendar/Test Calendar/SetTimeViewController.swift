//
//  SetTimeViewController.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/08/31.
//  Copyright © 2017年 山浦功. All rights reserved.
//

import UIKit
import MaterialComponents

class SetTimeViewController: UIViewController {

    var begin = NSDate()
    var finish = NSDate()
    var picker = UIDatePicker()
    let formatter = DateFormatter()
    
    @IBOutlet weak var watch: WatchView!
    @IBOutlet weak var amButton: WatchButton!
    @IBOutlet weak var pmButton: WatchButton!
    @IBOutlet weak var makeButton: ProcessButton!
    @IBOutlet weak var beginButton: UIButton!
    @IBOutlet weak var finishButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var beginField: UITextField!
    @IBOutlet weak var finishField: UITextField!
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func changeToAM(_ sender: Any) {
        watch.changeAmPm()
        changeWatchButtonType(am: amButton, pm: pmButton, type: .am)
    }
    
    @IBAction func changeToPM(_ sender: Any) {
        watch.changeAmPm()
        changeWatchButtonType(am: amButton, pm: pmButton, type: .pm)
    }

    override func loadView() {
        super.loadView()
        self.scrollView.addSubview(statusBar())
//        self.view.addSubview(statusBar())
        amButton.setTitle("AM", for: .normal)
        pmButton.setTitle("PM", for: .normal)
        changeWatchButtonType(am: amButton, pm: pmButton, type: .pm)
        makeButton.setTitle("テストスケジュール作成", for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeButton.delegate = self
        
        let datePicker = UIDatePicker()
        beginField.inputView = datePicker
        finishField.inputView = datePicker
        datePicker.locale = NSLocale(localeIdentifier: "ja_JP") as Locale
        setUpDatePicker(beginField)
        setUpDatePicker(finishField)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


// MARK: - Private
extension SetTimeViewController{
    
    fileprivate func setUpDatePicker(_ field: UITextField){
        formatter.setTemplate(.time)
        
        let pickerToolBar = UIToolbar(frame: CGRect(x: 0, y: self.view.frame.size.height/6, width: self.view.frame.size.width, height: 40.0))
        pickerToolBar.layer.position = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height-20.0)
        pickerToolBar.barStyle = .blackTranslucent
        pickerToolBar.tintColor = UIColor.white
        pickerToolBar.backgroundColor = UIColor.black
        
        let spaceBarBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace,target: self, action: nil)
        let toolBarBtn = UIBarButtonItem(title: "完了", style: .done, target: self, action: Selector(("toolBarBtnPush:")))
        
        pickerToolBar.items = [spaceBarBtn,toolBarBtn]
        field.inputAccessoryView = pickerToolBar
    }
    
    fileprivate func toolBarBtnPush(sender: UIBarButtonItem){
        
        let pickerDate = picker.date
        beginField.text = formatter.string(from: pickerDate)
        self.scrollView.endEditing(true)
    }
}

// MARK: - ProcessButtonDelegate
extension SetTimeViewController: ProcessButtonDelegate{
    func tapped() {
        print("スケジュール作成")
    }
}
