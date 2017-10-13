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
    @IBOutlet weak var beginField: UITextField!
    @IBOutlet weak var finishField: UITextField!
    
    var begin = NSDate()
    var finish = NSDate()
    var picker = UIDatePicker()
    var txtActiveField = UITextField()
    let formatter = DateFormatter()
    let screenSize = UIScreen.main.bounds.size
    
    
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

    override func loadView() {
        super.loadView()
        self.view.addSubview(statusBar())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeButton.delegate = self
        beginField.delegate = self
        finishField.delegate = self
        scrollView.delegate = self
        amButton.setTitle("AM", for: .normal)
        pmButton.setTitle("PM", for: .normal)
        changeWatchButtonType(am: amButton, pm: pmButton, type: .pm)
        makeButton.setTitle("テストスケジュール作成", for: .normal)
        setUpDatePicker()
        NotificationCenter.default.addObserver(self, selector: #selector(SetTimeViewController.handleKeyboardWillShowNotification(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(SetTimeViewController.handleKeyboardWillHideNotification(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true) //close picker
    }
}


// MARK: - Private
extension SetTimeViewController: UIScrollViewDelegate{
    
    func handleKeyboardWillShowNotification(_ notification: Notification) {
        
        let userInfo = notification.userInfo!
        let keyboardScreenEndFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let myBoundSize: CGSize = UIScreen.main.bounds.size
        let txtLimit = txtActiveField.frame.origin.y + txtActiveField.frame.height + 25.0
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
        beginField.inputView = picker
        finishField.inputView = picker
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
    }
}
