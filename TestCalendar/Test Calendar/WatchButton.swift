//
//  WatchButton.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/09/17.
//  Copyright © 2017年 山浦功. All rights reserved.
//


import UIKit


/// WatchViewを切り替えるButton
class WatchButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    /// Butttonの初期設定
    func commonInit(){
        let width = self.frame.width
        let height = width
        self.frame = CGRect(x: 0, y: 0, width: width, height: height)
        self.layer.cornerRadius = width/2
        self.layer.masksToBounds = true
        self.titleLabel?.textAlignment = .center

    }
}




/// AMボタンとPMボタンとの見た目を同時に切り替える
///
/// - Parameters:
///   - am: AMボタン
///   - pm: PMボタン
///   - type: WatchViewの状態:切り替えたい時間帯を入力
func changeWatchButtonType(am: WatchButton , pm: WatchButton, type: watchType){

    if type == .am{
        am.setTitleColor(WatchButtonColor.enabled(), for: .normal)
        am.backgroundColor = WatchButtonColor.selected()
        
        pm.setTitleColor(WatchButtonColor.selected() , for: .normal)
        pm.backgroundColor = WatchButtonColor.enabled()
    }else {
        am.setTitleColor(WatchButtonColor.selected(), for: .normal)
        am.backgroundColor = WatchButtonColor.enabled()
        
        pm.setTitleColor(WatchButtonColor.enabled(), for: .normal)
        pm.backgroundColor = WatchButtonColor.selected()
    }
}
