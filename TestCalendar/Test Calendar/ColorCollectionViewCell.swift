//
//  ColorCollectionViewCell.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/10/08.
//  Copyright © 2017年 山浦功. All rights reserved.
//

import UIKit

class ColorCollectionViewCell: UICollectionViewCell {
    
    func updateCell(_ number: Int, select: Bool){
        let view = UIView()
        let radius = self.frame.width * 0.40
        
        view.frame = CGRect(x: 0, y: 0, width: radius * 2, height: radius * 2 )
        view.backgroundColor = colors[number]
        if select == true {
            view.layer.borderColor = CalendarColor.black().cgColor
            view.layer.borderWidth = 2.0
        }
        view.layer.cornerRadius = radius
        view.clipsToBounds = true
        self.addSubview(view)
    }
}
