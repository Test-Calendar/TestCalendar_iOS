//
//  TestListTableViewCell.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/10/07.
//  Copyright © 2017年 山浦功. All rights reserved.
//

import UIKit

class TestListTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var color: UIView!
    @IBOutlet weak var hour: UILabel!
    @IBOutlet weak var startTime: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    /// Cellに名前、タイプ、色、勉強時間、テスト開始時刻の情報を格納する
    ///
    /// - Parameter timeListViewModel: 表示したいテスト情報モデル
    func updateCell(_ timeListViewModel: TestListViewModel){
        self.name.text = timeListViewModel.name
        if timeListViewModel.type == 0 {
            self.type.text = "テスト"
        }else {
            self.type.text = "レポート"
        }
        setColorView(timeListViewModel.color)
        self.hour.text = "\(timeListViewModel.study)"
        let formatter = DateFormatter()
        formatter.setTemplate(.full)
        self.startTime.text = formatter.string(from: timeListViewModel.time as Date)
    }
    
    
    /// Cellに表示される教科ごとの色を表示
    ///
    /// - Parameter colorName: CalendarColorの名前を入力
    fileprivate func setColorView(_ colorName: String){
        let width = color.frame.width
        let radius = width / 2
        color.backgroundColor = getColor(colorName)
        color.layer.cornerRadius = radius
        color.clipsToBounds = true
        
    }
}
