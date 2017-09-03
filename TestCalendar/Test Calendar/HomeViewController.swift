//
//  HomeViewController.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/08/31.
//  Copyright © 2017年 山浦功. All rights reserved.
//

import UIKit
import MaterialComponents

class HomeViewController: UIViewController{
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var calendarModel = CalendarViewModel()
    let cellMargin: CGFloat = 2.0
    let numberOfWeek: CGFloat = 7.0
    
    
    override func loadView() {
//        self.view = statusBar()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = calendarModel
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

//extension HomeViewController{
//    func addPlusButton(){
//        let floatingButton = MDCFloatingButton()
//        floatingButton.setTitle("+", for: .normal)
//        floatingButton.sizeToFit()
//        floatingButton.addTarget(self, action: Selector(("tap:")), for: .touchUpInside)
//        self.view.addSubview(floatingButton)
//    }
//}


extension HomeViewController: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("selected")
    }
}



extension HomeViewController:UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width:CGFloat = (collectionView.frame.width - cellMargin * 6)/numberOfWeek
        let height:CGFloat = (collectionView.frame.height - cellMargin * 6)/numberOfWeek
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
//    水平方向のマージン
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return cellMargin
    }
//    垂直方向のマージン
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return cellMargin
    }
}

