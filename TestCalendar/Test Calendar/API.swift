//
//  API.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/09/08.
//  Copyright © 2017年 山浦功. All rights reserved.
//

import RealmSwift
import Alamofire

func pushData(model: CalendarModel){
    let http = "https://httpbin.org/get"
    
    Alamofire.request(http, method: .post ).responseJSON { response in
        print("Request: \(String(describing: response.request))")   // original url request
        print("Response: \(String(describing: response.response))") // http url response
        print("Result: \(response.result)")                         // response serialization result
        
        if let json = response.result.value {
            print("JSON: \(json)") // serialized json response
            //set datas to each object
            
        }
        
        if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
            print("Data: \(utf8Text)") // original server data as UTF8 string
        }
    }
}
