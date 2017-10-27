////
////  CalendarCollectionViewCell.swift
////  Test Calendar
////
////  Created by 山浦功 on 2017/09/01.
////  Copyright © 2017年 山浦功. All rights reserved.
////
//
import UIKit

class CalendarCell: UICollectionViewCell {
    
    var dayLabel : UILabel!
    var events: UICollectionView!
    var colors = [UIColor]()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    private func commonInit(){
        events.delegate = self as? UICollectionViewDelegate
        events.dataSource = self as? UICollectionViewDataSource
        events.reloadData()
    }
}


// MARK: - Private
extension CalendarCell{
    
    /// CalendarCellに表示する円形のViewを生成する関数
    ///
    /// - Parameter color: cellに表示するものの背景の色をUIColorで渡す
    /// - Returns: 表示するUIViewを返す
    func setUp(_ color: UIColor) -> UIView{
        let view = UIView()
        let radius = (self.backgroundView?.frame.height)! / 2
        view.layer.masksToBounds = true
        view.layer.cornerRadius = radius
        view.backgroundColor = color
        return view
    }
    
    func updateData(){
        events.reloadData()
    }
}


// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension CalendarCell: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        if colors.isEmpty == true {
            cell.backgroundColor = .white
        }else {
            cell.backgroundView = setUp(colors[indexPath.row])
        }
        return cell
    }
}








