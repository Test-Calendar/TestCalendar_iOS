//
//  TestListViewController.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/08/31.
//  Copyright © 2017年 山浦功. All rights reserved.
//

import UIKit

protocol TestListDelegate: class{
    func setTestListsModel(_: TestListsViewModel)
    func changedStatus(_: TestListStatus)
}

/// テストとレポート一覧画面
class TestListViewController: UIViewController {
    
    var data: [TestListViewModel] = []
    var status: TestListStatus = .none
    var model = CalendarModel.sharedInstance
//    var presenter: HomeTestListViewPresenter!
    
    @IBOutlet weak var testListTitle: UILabel!
    @IBOutlet weak var testListView: UITableView!
    @IBOutlet weak var testListCell: UITableViewCell!
    @IBOutlet weak var addCell: UITableViewCell!
    @IBOutlet weak var ListCellBack: UIView!
    @IBOutlet weak var navigationBar: UINavigationItem!
    @IBOutlet weak var nextButton: ProcessButton!
    
    
    @IBAction func close(_ sender: Any) { //前の画面に戻る
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func segueToAdd(_ sender: Any) { //addへ
        performSegue(withIdentifier: "toAdd", sender: nil)
    }
    
    @IBAction func goBack(_ segue:UIStoryboardSegue) {}
    
    @IBAction func goBackFromSetTime(_ segue:UIStoryboardSegue) {}
    
    override func loadView() {
        super.loadView()
        self.view.addSubview(statusBar())
        nextButton.setTitle("次へ", for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nextButton.delegate = self
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(TestListViewController.refreshControlValueChanged(sender:)), for: .valueChanged)
        self.testListView.addSubview(refreshControl)
        loadData()
//        self.presenter?.delegate = self
//        self.presenter?.loadTestLists() //データの取得
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //画面遷移時にデータの受け渡し
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAdd" {
            let next: TestViewController = segue.destination as! TestViewController
            let data = TestListViewModel(name: "", type: 0, color: "", notification: false, study: 0, time: NSDate())
            next.data = data
        }
        if segue.identifier == "toEdit" {
            let next: TestViewController = segue.destination as! TestViewController
            let target = sender as! TestListViewModel
            next.data = target
        }
        
    }
    
    
    func refreshControlValueChanged(sender: UIRefreshControl) {
        loadData()
        sender.endRefreshing()
    }
}


extension TestListViewController{
    func loadData(){
        data.removeAll()
        let tests = model.getAllTest()
        for i in tests {
            let test = TestListViewModel(name: i.name, type: i.type, color: i.color, notification: i.notification, study: i.studyHour, time: i.startTime)
            data.append(test)
        }
        if tests.isEmpty == true{
            print("なんもねー")
            status = .none
        }else {
            status = .normal
        }
        self.testListView.reloadData()
    }
    
    func removeData(_ data: TestListViewModel){
        let predicate = NSPredicate(format: "name == %@", data.name)
        let target = model.searchTest(predicate: predicate)
        model.delete(object: target[0])
    }
}


// MARK: - TestListDelegate
extension TestListViewController: TestListDelegate{
   
    func setTestListsModel(_ viewModel: TestListsViewModel) {
        self.data  = viewModel.testLists
        self.testListView.reloadData()
    }
    
    func changedStatus(_ newStatus: TestListStatus) {
        status = newStatus
        self.testListView.reloadData()
    }
}


// MARK: - ProcessButtonDelegate
extension TestListViewController: ProcessButtonDelegate{
    
    /// 「次へ」ボタンがタップされた時に実行
    func tapped() {
        if data.isEmpty == false {
            //画面遷移
            self.performSegue(withIdentifier: "toNext", sender: nil)
        }else {
            let alert = UIAlertController(title: "データがありません。", message: "テスト情報を追加して下さい。", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}


// MARK: - UITableViewDataSource,UITableViewDelegate
extension TestListViewController: UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if status == .none {
            return 1
        }
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch  status {
        case .normal:
            let cell = tableView.dequeueReusableCell(withIdentifier: "normal", for: indexPath) as! TestListTableViewCell
            cell.updateCell(data[indexPath.row])
            return cell
        case .none:
            let cell = tableView.dequeueReusableCell(withIdentifier: "none", for: indexPath)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch status {
        case .none: break
        case .normal:
            let name = data[indexPath.row].name
            let predicate = NSPredicate(format: "name == %@", name)
            let target = model.searchTest(predicate: predicate)
            model.delete(object: target[0])
            self.performSegue(withIdentifier: "toEdit", sender: data[indexPath.row]) //値を渡す
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if status == .normal{
            if editingStyle == .delete{
                removeData(data[indexPath.row])
                data.remove(at: indexPath.row)
                testListView.deleteRows(at: [indexPath], with: .fade)
                self.testListView.reloadData()
            }
        }
    }
}
