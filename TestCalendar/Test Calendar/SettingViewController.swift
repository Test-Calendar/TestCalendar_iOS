//
//  SettingViewController.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/08/31.
//  Copyright © 2017年 山浦功. All rights reserved.
//

import UIKit
import MaterialComponents

class SettingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var header: UIView!
    @IBOutlet weak var settingTitle: UILabel!
    @IBOutlet weak var tableView: UITableView!
   
    // section毎の画像配列
    let Array1: NSArray = ["MorningTitle","MorningPicker","BeforeTimeTitle","BeforeTimePicker"]
    let Array2: NSArray = [""]
    
    
    // Sectionのタイトル
    var sectionTitle: NSArray = ["通知", "共有"]
    
    // 戻るボタンの設定
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
    
    // materialButtonの設置
    override func loadView() {
        super.loadView()
        self.view.addSubview(statusBar())
        setButton()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    // Table Viewのセルの数を指定
    func tableView(_ table: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 4
        }
        else if section == 1 {
            return 1
        }
        else{
            return 0
        }
    }
    
    // セクションのタイトルを返す.
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitle[section] as! String
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
        
        if indexPath.section == 0 {
            cell.textLabel?.text = "\(Array1[indexPath.row])"
        } else if indexPath.section == 1 {
            cell.textLabel?.text = "\(Array2[indexPath.row])"
        }
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionTitle.count
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
        flatButton.customTitleColor = UIColor.white
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
        flatButton.backgroundColor = UIColor.red
        
        // タイトルを設定する(通常時).
        flatButton.setTitle("iOSカレンダーへのアクセスを許可", for: .normal)
        flatButton.setTitleColor(UIColor.white, for: .normal)
        
        // ボタンにタグをつける.
        flatButton.tag = 1
        
        // ボタンをViewに追加.
        self.view.addSubview(flatButton)
        
    }
}
