//
//  ShowDayTableViewCell.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/09/17.
//  Copyright © 2017年 山浦功. All rights reserved.
//

import UIKit

class ShowDayTableViewCell: UITableViewCell {

    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    convenience init(){
        self.init()
        let radius = colorView.frame.width / 2
        colorView.layer.cornerRadius = radius
        colorView.layer.masksToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }

}
