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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(statusBar())
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

//extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource{
//    
//}

//extension HomeViewController{
//    func addPlusButton(){
//        let floatingButton = MDCFloatingButton()
//        floatingButton.setTitle("+", for: .normal)
//        floatingButton.sizeToFit()
//        floatingButton.addTarget(self, action: Selector(("tap:")), for: .touchUpInside)
//        self.view.addSubview(floatingButton)
//    }
//}
