//
//  KoyomiViewController.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/09/05.
//  Copyright © 2017年 山浦功. All rights reserved.
//

import UIKit
import Koyomi



class KoyomiViewController: UIViewController {


    @IBOutlet weak var koyomi: Koyomi! {
        didSet {
            koyomi.sectionSpace = 1.5
            koyomi.inset = .zero
            koyomi.cellSpace = 0.5
            koyomi.weekCellHeight = 25
            koyomi.circularViewDiameter = 0.2
            koyomi.calendarDelegate = self
            koyomi.inset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            koyomi.weeks = ("Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat")
            koyomi.style = .standard
            koyomi.dayPosition = .center
            koyomi.selectionMode = .sequence(style: .semicircleEdge)
            koyomi.selectedStyleColor = UIColor(red: 203/255, green: 119/255, blue: 223/255, alpha: 1)
            koyomi
                .setDayFont(size: 14)
                .setWeekFont(size: 10)
        }
    }
    
    fileprivate let invalidPeriodLength = 90
    

    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


extension KoyomiViewController: KoyomiDelegate{
    func koyomi(_ koyomi: Koyomi, didSelect date: Date?, forItemAt indexPath: IndexPath) {
        print("You Selected: \(date)")
    }
    
    func koyomi(_ koyomi: Koyomi, currentDateString dateString: String) {
        print("tttttttt")
    }
    
    @objc(koyomi:shouldSelectDates:to:withPeriodLength:)
    func koyomi(_ koyomi: Koyomi, shouldSelectDates date: Date?, to toDate: Date?, withPeriodLength length: Int) -> Bool {
        if length > invalidPeriodLength {
            print("More than \(invalidPeriodLength) days are invalid period.")
            return false
        }
        return true
    }

}
