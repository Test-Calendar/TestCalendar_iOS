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
        setButton()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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

extension SetTimeViewController{
    func setButton(){
        let flatButton = MDCFlatButton()
        flatButton.customTitleColor = UIColor.red
        flatButton.setTitle("Flat Button", for: .normal)
        flatButton.sizeToFit()
        flatButton.addTarget(self, action: #selector(SettingViewController.flatButtonDidTap(_:)), for: .touchUpInside)
        
        
        // ボタンのサイズ.
        let bWidth: CGFloat = 347
        let bHeight: CGFloat = 46
        
        // ボタンのX,Y座標.
        let posX: CGFloat = self.view.frame.width/2 - bWidth/2
        let posY: CGFloat = self.view.frame.height - bHeight - 12
        
        // ボタンの設置座標とサイズを設定する.
        flatButton.frame = CGRect(x: posX, y: posY, width: bWidth, height: bHeight)
        
        // ボタンの背景色を設定.
        flatButton.backgroundColor = UIColor.gray
        
        // タイトルを設定する(通常時).
        flatButton.setTitle("テストスケジュールの作成", for: .normal)
        flatButton.setTitleColor(UIColor.white, for: .normal)
        
        // ボタンにタグをつける.
        flatButton.tag = 1
        
        // ボタンをViewに追加.
        self.view.addSubview(flatButton)
        
    }

}
