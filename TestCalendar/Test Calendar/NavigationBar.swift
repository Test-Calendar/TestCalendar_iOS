//
//  NavigationBar.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/10/13.
//  Copyright © 2017年 山浦功. All rights reserved.
//

import Foundation
import UIKit



class CustomNavigationBar: UINavigationBar {
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        super.sizeThatFits(size)
        var barSize = size
        barSize.width = self.frame.width
        barSize.height += 50
        return barSize
    }
}
