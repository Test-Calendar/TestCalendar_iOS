//
//  CalendarCollectionViewCell.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/09/01.
//  Copyright © 2017年 山浦功. All rights reserved.
//
//
import UIKit


class CalendarCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    var dayLabel = UILabel()
    var events = UICollectionView()
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
        events.delegate = self
        events.dataSource = self
        setUpView()
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
        cell.frame = CGRect(x: 0, y: 0, width: self.frame.width / 3, height: self.frame.height / 2)
        if colors.isEmpty == true {
            cell.backgroundColor = .white
        }else {
            cell.backgroundView = setUpView(colors[indexPath.row])
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
    func setUpView(_ color: UIColor) -> UIView{
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
    
    
    ///表示するラベルとCollectionViewの制約(Autolayout)と
    ///ラベルの位置や形、collectionViewのscrollをfalseにするなどの初期設定をする。
    func setUpView(){
        self.dayLabel.frame = CGRect(x: 0, y: 0, width: self.frame.width * 0.8, height: self.frame.height * 0.5)
        
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
        
//        let radius = (dayLabel.frame.height - 10) / 2
//        self.dayLabel.layer.cornerRadius = radius
//        self.dayLabel.layer.masksToBounds = true
//        self.dayLabel.textColor = .black
//        self.dayLabel.textAlignment = .center
//        self.events.isScrollEnabled = false
//        
        self.addSubview(dayLabel)
        self.addSubview(events)
    }
}
