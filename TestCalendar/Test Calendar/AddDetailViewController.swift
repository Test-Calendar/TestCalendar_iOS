//
//  AddDetailViewController.swift
//  Test Calendar
//
//  Created by 阿部拓海 on 2017/09/19.
//  Copyright © 2017年 山浦功. All rights reserved.
//

import UIKit

class AddDetailViewController: UITableViewController {
    
    @IBOutlet weak var subjectName: UITextField!
    @IBOutlet weak var selectType: UISegmentedControl!
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var notificationLabel: UILabel!
    @IBOutlet weak var studyTitleLabel: UILabel!
    @IBOutlet weak var studyTimeLabel: UILabel!
    @IBOutlet weak var studyPickerView: UIPickerView!
    @IBOutlet weak var startTitleLabel: UILabel!
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var startPickerView: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


extension AddDetailViewController{
    
}
