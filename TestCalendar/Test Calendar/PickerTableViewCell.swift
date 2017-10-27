//
//  PickerTableViewCell.swift
//  Test Calendar
//
//  Created by 阿部拓海 on 2017/10/08.
//  Copyright © 2017年 山浦功. All rights reserved.
//

import UIKit

class PickerTableViewCell: UITableViewCell, UIPickerViewDelegate{
    
    
    @IBOutlet weak var TimeSetPicker: UIPickerView!
    
    private let morning: NSArray = [["1","2","3","4","5","6","7","8","9","10","11","12"],["5","10","15","25","30","35","40","45","50","55"]]
    private let before: NSArray = ["5","10","15","25","30","35","40","45","50","55","60"]
    
    let Time = ["morning", "before"]
    
    
    //pickerに表示する値を返すデリゲートメソッド.
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return morning[row] as? String
        return before[row] as? String
    }
    
    func updateCell(num: Int){
        if num == 0{
            print(morning)
        }
        else {
            print(before)
        }
        
    }


    
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
