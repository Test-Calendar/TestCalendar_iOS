//
//  TestViewController.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/09/28.
//  Copyright © 2017年 山浦功. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    
    let button = BottomButton()
    var tableViewCells = [TitleTableViewCell(), TypeTableViewCell(), ColorTableViewCell(), NoticeTableViewCell(), TimeTableViewCell(), DeadlineTableViewCell()]
    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet weak var subjectTextField: UITextField!
    @IBOutlet weak var typeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(statusBar())
        button.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


// MARK: - BottomButtonDelegate
extension TestViewController: BottomButtonDelegate{
    func tapped() {
        print("tapped")
    }
}
