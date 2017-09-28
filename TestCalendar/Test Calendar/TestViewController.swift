//
//  TestViewController.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/09/28.
//  Copyright © 2017年 山浦功. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    
//    let button = BottomButton()

    var tableViewCells = [TitleTableViewCell(), TypeTableViewCell(), ColorTableViewCell(), NoticeTableViewCell(), TimeTableViewCell(), DeadlineTableViewCell()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(statusBar())
//        button.delegate = self
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


// MARK: - UITableViewDelegate, UITableViewDataSource
extension TestViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected")
    }
    
}


//// MARK: - BottomButtonDelegate
//extension TestViewController: BottomButtonDelegate{
//    func tapped() {
//        print("tapped")
//    }
//}
