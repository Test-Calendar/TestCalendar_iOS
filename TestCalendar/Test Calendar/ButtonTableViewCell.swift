
//
//  ButtonTableViewCell.swift
//  Test Calendar
//
//  Created by 阿部拓海 on 2017/10/09.
//  Copyright © 2017年 山浦功. All rights reserved.
//

import UIKit

class ButtonTableViewCell: UITableViewCell{
    
    @IBOutlet weak var makeButton: ProcessButton!
    
    // materialButtonの設置
    func updateCell(){
        addSubview(statusBar())
        makeButton.setTitle("iOSカレンダーと共有", for: .normal)
        
    
        func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

        func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
}
