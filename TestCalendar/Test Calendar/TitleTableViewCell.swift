//
//  TitleTableViewCell.swift
//  Test Calendar
//
//  Created by 阿部拓海 on 2017/10/08.
//  Copyright © 2017年 山浦功. All rights reserved.
//

import UIKit

class TitleTableViewCell: UITableViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    
    let title = ["朝","勉強前"]
    
    convenience init() {
        self.init()
        
    }
    
    func updateCell(count: Int){
            titleLabel.text = title[count]
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
