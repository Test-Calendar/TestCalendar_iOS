//
//  API.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/09/08.
//  Copyright © 2017年 山浦功. All rights reserved.
//

import RealmSwift
import Alamofire
import SwiftyJSON

enum ApiStatus {
    case update
    case failture
    case success
}

protocol ApiServiceProtocol {
    func pushData(_ period: Period)
}



class ApiService: ApiServiceProtocol{

    let baseURL = "http://127.0.0.1:8000/api/show/"
    var status = ApiStatus.update
    let model = CalendarModel.sharedInstance
    
    func pushData(_ period: Period) {
        print("pushData")
        
        Alamofire.request(baseURL, method: .post )
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                if response.result.isSuccess == true {
                    print("POST Success!!!")
                    self.getData()
                    self.status = .success
                }else {
                    print("POST Failture!!!")
                    self.status = .failture
                }
//            print("Request: \(String(describing: response.request))")   // original url request
//            print("Response: \(String(describing: response.response))") // http url response
//            print("Result: \(response.result)")                         // response serialization result
            
//            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
//                print("Data: \(utf8Text)") // original server data as UTF8 string
//            }
        }
    }
    
    func getData(){
        let getHttp = "/api/show/"
        
        Alamofire.request(baseURL + getHttp, method: .get).responseJSON{ response in
            print(response.result)
            if response.result.isSuccess == true {
                guard let object = response.result.value else { return }
                let json = JSON(object)
                json.forEach({ (_, json) in
                    let study = self.model.createStudy(json)
                    self.model.save(object: study)
                })
                print(self.model.getAllStudy())
            } else {
                print("失敗")
            }
        }
    }
}


extension ApiService{

//    fileprivate func makeParam() -> JSON{
//        
//    }
    
    /// apiにデータを送レルか確認するためのテスト用データ
    /// 本番では使用しない
    ///
    /// - Returns: JSON型を返す
    fileprivate func testParam() -> JSON{
        let formatter = DateFormatter()
        formatter.setTemplate(.full)
        let date = NSDate()
        let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: date as Date)!
        let object: JSON = [
            "Task": [
                "name": "バイト",
                "start": formatter.string(from: date as Date),
                "end": formatter.string(from: date as Date)
            ],
            "Test": [
                "name": "数学",
                "stype": "0",
                "studyTime": formatter.string(from: tomorrow),
                "start": formatter.string(from: date as Date)
            ],
            "TimeZone": [
                "start": "19",
                "end": "23"
            ]
        ]
        
        return object
    }
}
