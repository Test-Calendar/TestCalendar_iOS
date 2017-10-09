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
        makeButton.setTitle("テストスケジュール作成", for: .normal)
//        setButton()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeButton.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func flatButtonDidTap(_ sender: UIButton){
        let SetTimeViewController = self.storyboard!.instantiateViewController( withIdentifier: "SelectCalendar" ) as! SelectCalendarViewController
        performSegue(withIdentifier: "SelectCalendarViewController", sender: nil)
        self.present(SetTimeViewController, animated: true, completion: nil)
    }
}


extension SetTimeViewController: ProcessButtonDelegate{
    func tapped() {
        print("スケジュール作成")
    }
}
