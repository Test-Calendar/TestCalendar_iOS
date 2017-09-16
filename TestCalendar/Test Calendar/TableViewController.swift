//
//  TableViewController.swift
//  Test Calendar
//
//  Created by 阿部拓海 on 2017/09/17.
//  Copyright © 2017年 山浦功. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController{
    
    let kPickerAnimationDuration = 0.40
    let kTitleKey = "title"
    let kDateKey  = "date"
    let kTimeRow = 4
    let kDateRow = 5
    
    let kDateCellID = "dateCell";
    let kDatePickerCellID = "datePickerCell";
    let kOtherCellID      = "otherCell";
    
    var dataArray: [[String: AnyObject]] = []
    var dateFormatter = DateFormatter()
    var datePickerIndexPath: NSIndexPath?
    var pickerCellRowHeight: CGFloat = 216
    
    @IBOutlet weak var SubjectName: UITextField!
    @IBOutlet weak var TimeDetail: UILabel!
    @IBOutlet weak var TimePicker: UIPickerView!
    @IBOutlet weak var DateDetail: UILabel!
    @IBOutlet weak var DatePicker: UIDatePicker!
    
    @IBAction func SelectButton(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
            }

   /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    */
}
