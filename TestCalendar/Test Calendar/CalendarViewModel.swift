//
//  CalendarViewModel.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/09/01.
//  Copyright © 2017年 山浦功. All rights reserved.
//

import UIKit

class CalendarViewModel: NSObject{
    
    override init() {
        super.init()
    }
}

extension CalendarViewModel: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CalendarCell
        cell.backgroundColor = UIColor.white
        cell.dayLabel.text = "2"
        return cell
    }
}
