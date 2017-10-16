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

    @IBOutlet weak var watch: WatchView!
    @IBOutlet weak var amButton: WatchButton!
    @IBOutlet weak var pmButton: WatchButton!
    @IBOutlet weak var makeButton: ProcessButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var beginField: DatePickerTextField!
    @IBOutlet weak var endField: DatePickerTextField!
    
    
    var begin = NSDate()
    var finish = NSDate()
    var picker = UIDatePicker()
    var txtActiveField = UITextField()
    let formatter = DateFormatter()
    let screenSize = UIScreen.main.bounds.size
    
    
    override func loadView() {
        super.loadView()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.view.addSubview(statusBar())
        amButton.setTitle("AM", for: .normal)
        pmButton.setTitle("PM", for: .normal)
        changeWatchButtonType(am: amButton, pm: pmButton, type: .pm)
        makeButton.setTitle("テストスケジュール作成", for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeButton.delegate = self
//        beginField.delegate = self
//        endField.delegate = self
        scrollView.delegate = self
//        setUpDatePicker()
//        NotificationCenter.default.addObserver(self, selector: #selector(SetTimeViewController.handleKeyboardWillShowNotification(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(SetTimeViewController.handleKeyboardWillHideNotification(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true) //close picker
    }
    
    
    @IBAction func beginFieldEditing(_ sender: UITextField) {
    }
    
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
}


// MARK: - Private
extension SetTimeViewController{
    
}


// MARK: - UIScrollViewDelegate
extension SetTimeViewController: UIScrollViewDelegate{
    
    func handleKeyboardWillShowNotification(_ notification: Notification) {
        
        let userInfo = notification.userInfo!
        let keyboardScreenEndFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let myBoundSize: CGSize = UIScreen.main.bounds.size
        let txtLimit = txtActiveField.frame.origin.y + txtActiveField.frame.height + 50.0
        let kbdLimit = myBoundSize.height - keyboardScreenEndFrame.size.height
        
        if txtLimit >= kbdLimit {
            scrollView.contentOffset.y = txtLimit - kbdLimit
        }
    }
    
    func handleKeyboardWillHideNotification(_ notification: Notification) {
        scrollView.contentOffset.y = 0
    }

    fileprivate func setUpDatePicker(){
        picker.datePickerMode = .time
        picker.addTarget(self, action: #selector(SetTimeViewController.changeDate(sender:)), for: .valueChanged)
        beginField.inputView = picker
        endField.inputView = picker
        addToolBarButton()
    }
    
    func addToolBarButton(){
        var toolBar = UIToolbar()
        toolBar = UIToolbar(frame: CGRect(x: 0, y: self.view.frame.size.height/6, width:self.view.frame.size.width, height:40.0))
        toolBar.layer.position = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height-20.0)
        toolBar.barStyle = .blackTranslucent
        toolBar.tintColor = UIColor.white
        toolBar.backgroundColor = UIColor.black
        let toolBarBtn = UIBarButtonItem(title: "完了", style: .plain, target: self, action: #selector(SetTimeViewController.tappedToolBarBtn(sender:)))
        toolBar.items = [toolBarBtn]
        beginField.inputAccessoryView = toolBar
        endField.inputAccessoryView = toolBar
    }
    
    // 「完了」を押すと閉じる
    func tappedToolBarBtn(sender: UIBarButtonItem) {
        txtActiveField.resignFirstResponder()
    }
    
    func changeDate(sender: AnyObject?){
        let datePicker: UIDatePicker = sender as! UIDatePicker
        beginField.text = formatter.string(from: datePicker.date)
        print(formatter.string(from: datePicker.date))
    }
}


// MARK: - UITextFieldDelegate
extension SetTimeViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        txtActiveField = textField
        return true
    }
}

// MARK: - ProcessButtonDelegate
extension SetTimeViewController: ProcessButtonDelegate{
    func tapped() {
        print("スケジュール作成")
//        makeTestScheduele()
    }
}
