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
    var presenter: TestListPresenter?
    
    @IBOutlet weak var testListTitle: UILabel!
    @IBOutlet weak var testListView: UITableView!
    @IBOutlet weak var testListCell: UITableViewCell!
    @IBOutlet weak var addCell: UITableViewCell!
    @IBOutlet weak var ListCellBack: UIView!
    @IBOutlet weak var navigationBar: UINavigationItem!
    @IBOutlet weak var nextButton: ProcessButton!
    
    //前の画面に戻る
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func loadView() {
        super.loadView()
        self.view.addSubview(statusBar())
        nextButton.setTitle("次へ", for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nextButton.delegate = self
        self.presenter?.loadTestLists() //データの取得
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //画面遷移時にデータの受け渡し
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
//        let nextViewController  = (segue.destination as! AddTestViewController)
//        AddTestViewController.someting = ??  ここで次の画面に値を渡す
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
            print(indexPath.row)
            self.performSegue(withIdentifier: "addTest", sender: data) //値を渡す
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if status == .normal{
            if editingStyle == .delete{
                data.remove(at: indexPath.row)
                self.presenter?.deleteTestList(indexPath.row)
                testListView.deleteRows(at: [indexPath], with: .fade)
            }
        }
    }
}
