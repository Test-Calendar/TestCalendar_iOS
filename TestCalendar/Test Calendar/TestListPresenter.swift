//
//  MTCPresenter.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/10/08.
//  Copyright © 2017年 山浦功. All rights reserved.
//
import Foundation


enum TestListStatus {
    case normal
    case none
    case update
}

protocol TestListPresenter {
    func loadTestLists()
    func deleteTestList(_ number: Int)
}


class HomeTestListViewPresenter: TestListPresenter {
    
    var data: TestListsViewModel?
    var delegate: TestListDelegate?
    var model = CalendarModel.sharedInstance
        
    func deleteTestList( _ number: Int) {
        if data?.testLists.isEmpty == true{
            data?.testLists.remove(at: number)
            self.delegate?.setTestListsModel(data!)
        }else {
            print("error there is no data to delete")
        }
    }

    func loadTestLists() {
        getTests()
        if data?.testLists.isEmpty == true{
            self.delegate?.changedStatus(.none)
        }else {
            self.delegate?.setTestListsModel(data!)
            self.delegate?.changedStatus(.normal)
        }
    }
}


// MARK: - Private
extension HomeTestListViewPresenter{
    fileprivate func getTests(){
        let tests = model.getAllTest()
        for test in tests {
            let vm = TestListViewModel(name: test.name, type: test.type, color: test.color, notification: test.notification, study: test.studyHour, time: test.startTime)
            data?.testLists.append(vm)
        }
    }
}
