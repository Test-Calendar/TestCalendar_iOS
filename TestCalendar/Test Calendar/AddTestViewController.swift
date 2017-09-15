//
//  AddTestViewController.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/08/31.
//  Copyright © 2017年 山浦功. All rights reserved.
//

import UIKit
import MaterialComponents

class AddTestViewController: UIViewController {

    @IBOutlet weak var header: UILabel!
    
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func loadView() {
        super.loadView()
        setButton()
    }
    
    
    func flatButtonDidTap(_ sender: UIButton){
        let SetTimeViewController = self.storyboard!.instantiateViewController( withIdentifier: "SetTime" ) as! SetTimeViewController
//        performSegue(withIdentifier: "SetTimeViewController", sender: nil)
        self.present(SetTimeViewController, animated: true, completion: nil)
    }

}


extension AddTestViewController{
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
        let posY: CGFloat = self.view.frame.height - bHeight - 30
        
        // ボタンの設置座標とサイズを設定する.
        flatButton.frame = CGRect(x: posX, y: posY, width: bWidth, height: bHeight)
        
        // ボタンの背景色を設定.
        flatButton.setBackgroundColor(UIColor.red, for: .normal)
        
        // タイトルを設定する(通常時).
        flatButton.setTitle("次へ", for: .normal)
        flatButton.setTitleColor(UIColor.white, for: .normal)
        
        // ボタンにタグをつける.
        flatButton.tag = 1
        
        // ボタンをViewに追加.
        self.view.addSubview(flatButton)
        
    }
    
}


