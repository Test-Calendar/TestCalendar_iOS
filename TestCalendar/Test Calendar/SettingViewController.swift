//
//  SettingViewController.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/08/31.
//  Copyright © 2017年 山浦功. All rights reserved.
//

import UIKit
import MaterialComponents

class SettingViewController: UIViewController {
    
    @IBOutlet weak var header: UIView!
    @IBOutlet weak var settingTitle: UILabel!
    @IBOutlet weak var notificationTitle: UILabel!
    @IBOutlet weak var contents: UIView!
    @IBOutlet weak var morningTitle: UILabel!
    @IBOutlet weak var MDatePicker: UIDatePicker!
    @IBOutlet weak var beforeTimeTitle: UILabel!
    @IBOutlet weak var BTimeDatePicker: UIDatePicker!
    @IBOutlet weak var AccessTitle: UILabel!
   
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    // morningの時間設定
    @IBAction func mChangeDate(_ sender: Any) {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
    }
    
    // beforeTimeの時間設定
    @IBAction func bTimeChangeDate(_ sender: Any) {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
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
    
    // ボタンを押すとiOS設定を起動、遷移する
    func flatButtonDidTap(_ sender: UIButton){
        if let url = URL(string:"App-Prefs:root=NOTIFICATIONS_ID") {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
}

extension SettingViewController{
    func setButton(){
        let flatButton = MDCFlatButton()
        flatButton.customTitleColor = UIColor.black
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
        flatButton.setTitle("iOSカレンダーへのアクセスを許可", for: .normal)
        flatButton.setTitleColor(UIColor.white, for: .normal)
        
        // ボタンにタグをつける.
        flatButton.tag = 1
        
        // ボタンをViewに追加.
        self.view.addSubview(flatButton)
        
    }
}
