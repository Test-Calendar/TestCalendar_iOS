//
//  CalendarCollectionViewCell.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/09/01.
//  Copyright © 2017年 山浦功. All rights reserved.
//
//
import UIKit


struct CalendarViewModel {
    var day: String
    var test: UIColor
    var colors: [UIColor]
}


class CalendarCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource{
    
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
        setUpView()
        self.addSubview(dayLabel)
        self.addSubview(events)
        events.delegate = self
        events.dataSource = self
        events.reloadData()
    }
}


// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension CalendarCell{
    
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


// MARK: - Private
extension CalendarCell{
    
    /// 日付を表示するcollectionViewのcellにデータを入れる
    ///
    /// - Parameter data: 表示したいデータ
    func updateCell(_ data: CalendarViewModel){
        colors = data.colors
        setTest(data.test)
        events.reloadData()
    }
    
    /// CalendarCellに表示する円形のUIViewを生成する。
    /// cellの幅の半分の半径を持つ円形のViewが生成される。
    ///
    /// - Parameter color: cellに表示する背景色
    /// - Returns: 表示するUIView
    func setUp(_ color: UIColor) -> UIView{
        let view = UIView()
        let radius = (self.backgroundView?.frame.height)! / 2
        view.layer.masksToBounds = true
        view.layer.cornerRadius = radius
        view.backgroundColor = color
        return view
    }
    
    /// 日付にテストがある場合に日付ラベルの背景に色をつける
    ///
    /// - Parameter color: 新しく表示する背景色
    func setTest(_ color: UIColor){
        dayLabel.backgroundColor = color
        dayLabel.textColor = .white
    }
    
    
    /// 表示する日付ラベルとテスト及び予定を表示する
    /// collectionViewのAutolayoutを設定する
    func setUpView(){
        self.backgroundView?.addConstraints([
            Constraint(item: dayLabel, .top, to: self, .height, constant: 10),
            Constraint(item: dayLabel, .left, to: self, .left, constant: 10),
            Constraint(item: dayLabel, .right, to: self, .left, constant: 10),
            Constraint(item: dayLabel, .height, to: self, .height, multiplier: 0.3),
            Constraint(item: events, .height, to: dayLabel, .bottom, constant: 10),
            Constraint(item: events, .left, to: self, .left, constant: 10),
            Constraint(item: events, .right, to: self, .right, constant: 10),
            Constraint(item: events, .bottom, to: self, .bottom, constant: 10)
        ])
    }
}
