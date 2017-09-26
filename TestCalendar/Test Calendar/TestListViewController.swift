//
//  TestListViewController.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/08/31.
//  Copyright © 2017年 山浦功. All rights reserved.
//

import UIKit


/// テストとレポート一覧画面
class TestListViewController: UIViewController {
    @IBOutlet weak var testListTitle: UILabel!
    @IBOutlet weak var testListView: UITableView!
    @IBOutlet weak var testListCell: UITableViewCell!
    @IBOutlet weak var addCell: UITableViewCell!
    @IBOutlet weak var ListCellBack: UIView!
    @IBOutlet weak var navigationBar: UINavigationItem!
    
    var names = ["ataso","sazae", "mauso"]

    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func loadView() {
        super.loadView()
        self.view.addSubview(statusBar())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.titleView?.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 64)
//        self.preferredContentSize
        let leftCloseButton:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(TestListViewController.closeThisPage))
        let rightCloseButton: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: Selector(("addNewTest")))
        self.navigationItem.setLeftBarButton(leftCloseButton, animated: true)
        self.navigationItem.setRightBarButton(rightCloseButton, animated: true)
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let nextViewController  = (segue.destination as! AddTestViewController)
//        AddTestViewController.someting = ??  ここで次の画面に値を渡す
        
    }
}


// MARK: - UITableViewDataSource,UITableViewDelegate
extension TestListViewController: UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected ")
        //値を渡す
//        self.performSegue(withIdentifier: "addTest", sender: something)
    }
}


extension TestListViewController{
    
    func closeThisPage(){
        self.dismiss(animated: true, completion: nil)
    }
    
    func addNewTest(){
        self.performSegue(withIdentifier: "addTest", sender: nil)
//        let storyboard: UIStoryboard = self.storyboard!
//        let nextView = storyboard.instantiateViewController(withIdentifier: "addTest")
//        present(nextView, animated: true, completion: nil)
    }
}
