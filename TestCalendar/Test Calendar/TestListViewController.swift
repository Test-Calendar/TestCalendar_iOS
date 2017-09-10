//
//  TestListViewController.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/08/31.
//  Copyright © 2017年 山浦功. All rights reserved.
//

import UIKit

class TestListViewController: UIViewController {
    @IBOutlet weak var testListTitle: UILabel!
    @IBOutlet weak var testListView: UITableView!
    @IBOutlet weak var testListCell: UITableViewCell!
    @IBOutlet weak var ListCellBack: UIView!
    
    var names = ["ataso","sazae", "mauso"]

    override func loadView() {
        super.loadView()
        self.view.addSubview(statusBar())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension TestListViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return names.count
        }else {
            return 1
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "add", for: indexPath)
            return cell
        }
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
}
