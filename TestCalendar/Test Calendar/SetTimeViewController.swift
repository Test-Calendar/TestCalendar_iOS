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
    
    @IBOutlet weak var watch: WatchView!
    @IBOutlet weak var amButton: WatchButton!
    @IBOutlet weak var pmButton: WatchButton!
    @IBOutlet weak var makeButton: ProcessButton!
    @IBOutlet weak var beginButton: UIButton!
    @IBOutlet weak var finishButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


// MARK: - Private
extension SetTimeViewController{
    func showAlart(_ title: String){
//        let alert = UIAlertController(title: title, message: "時間を選択してください", preferredStyle: .alert)
//        let margin: CGFloat = 10.0
//        let rect = CGRect(x: margin, y: margin, width: alert.view.bounds.size.width - margin * 4 , height: 120)
//        let picker = UIDatePicker()
//        
//        picker.backgroundColor = .white
//        picker.frame = rect
//        alert.view.addSubview(picker)
//        alert.addAction(UIAlertAction(title: "OK", style: .default , handler: nil))
//        alert.addAction(UIAlertAction(title: "キャンセル", style: .cancel, handler: nil))
//        DispatchQueue.main.async {
//            self.present(alert, animated: true, completion: nil)
//        }
    }
}

// MARK: - ProcessButtonDelegate
extension SetTimeViewController: ProcessButtonDelegate{
    func tapped() {
        print("スケジュール作成")
    }
}
