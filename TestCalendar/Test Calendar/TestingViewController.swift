//
//  FirstViewController.swift
//  EventKit01
//

import UIKit
import EventKit

class TestingViewController: UIViewController {
    
    var myEventStore: EKEventStore!
    var myEvents: NSArray!
    var myTargetCalendar: EKCalendar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 背景を水色に設定.
        self.view.backgroundColor = UIColor.cyan
        
        // EventStoreを生成する.
        myEventStore = EKEventStore()
        
        // ユーザーにカレンダーの使用の許可を求める.
        allowAuthorization()
        
        // Buttonを生成する.
        let myButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        myButton.setTitle("getEvent", for: UIControlState.normal)
        myButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        myButton.backgroundColor = UIColor.red
        myButton.layer.masksToBounds = true
        myButton.layer.cornerRadius = 50.0
        myButton.center = self.view.center
        myButton.addTarget(self, action: #selector(TestingViewController.onClickMyButton(sender:)), for: UIControlEvents.touchUpInside)
        
        // Buttonをviewに追加.
        self.view.addSubview(myButton)
    }
    
    /*
     認証ステータスを取得.
     */
    func getAuthorization_status() -> Bool {
        
        // ステータスを取得.
        let status: EKAuthorizationStatus = EKEventStore.authorizationStatus(for: EKEntityType.event)
        
        // ステータスを表示 許可されている場合のみtrueを返す.
        switch status {
        case EKAuthorizationStatus.notDetermined:
            print("NotDetermined")
            return false
            
        case EKAuthorizationStatus.denied:
            print("Denied")
            return false
            
        case EKAuthorizationStatus.authorized:
            print("Authorized")
            return true
            
        case EKAuthorizationStatus.restricted:
            print("Restricted")
            return false
            
        default:
            print("error")
            return false
        }
    }
    
    /*
     認証許可.
     */
    func allowAuthorization() {
        
        // 許可されていなかった場合、認証許可を求める.
        if getAuthorization_status() {
            return
        } else {
            
            // ユーザーに許可を求める.
            myEventStore.requestAccess(to: EKEntityType.event, completion: {
                (granted , error) -> Void in
                
                // 許可を得られなかった場合アラート発動.
                if granted {
                    return
                }
                else {
                    
                    // メインスレッド 画面制御. 非同期.
                    DispatchQueue.main.async {
                        let myAlert = UIAlertController(title: "許可されませんでした", message: "Privacy->App->Reminderで変更してください", preferredStyle: UIAlertControllerStyle.alert)
                        
                        // アラートアクション.
                        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
                        
                        myAlert.addAction(okAction)
                        self.present(myAlert, animated: true, completion: nil)

                    }
//                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
//                        
//                        // アラート生成.
//                        let myAlert = UIAlertController(title: "許可されませんでした", message: "Privacy->App->Reminderで変更してください", preferredStyle: UIAlertControllerStyle.alert)
//                        
//                        // アラートアクション.
//                        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
//                        
//                        myAlert.addAction(okAction)
//                        self.presentViewController(myAlert, animated: true, completion: nil)
//                    })
                }
            })
        }
    }
    
    /*
     Buttonが押されたときに呼ばれるメソッド.
     */
    func onClickMyButton(sender: UIButton) {
        print("onClickMyButton")
        
        // NSCalendarを生成.
        var myCalendar: NSCalendar = NSCalendar.current as NSCalendar
        
        // ユーザのカレンダーを取得.
        var myEventCalendars = myEventStore.calendars(for: EKEntityType.event)
        
        // 開始日(昨日)コンポーネントの生成.
        let oneDayAgoComponents: NSDateComponents = NSDateComponents()
        oneDayAgoComponents.day = -1
        
        // 昨日から今日までのNSDateを生成.
        let oneDayAgo: NSDate = myCalendar.date(byAdding: oneDayAgoComponents as DateComponents, to: Date(), options: NSCalendar.Options.init(rawValue: .allZeros))! as NSDate
        
        
        // 終了日(一年後)コンポーネントの生成.
        let oneYearFromNowComponents: NSDateComponents = NSDateComponents()
        oneYearFromNowComponents.year = 1
        
        // 今日から一年後までのNSDateを生成.
        let oneYearFromNow: NSDate = myCalendar.date(byAdding: oneYearFromNowComponents as DateComponents, to: Date(), options: .init(rawValue: .allZeros))! as NSDate
        
        
        
        // イベントストアのインスタンスメソッドで述語を生成.
        var predicate = NSPredicate()
        
        // ユーザーの全てのカレンダーからフェッチせよ.
        predicate = myEventStore.predicateForEvents(withStart: oneDayAgo as Date,
                                                    end: oneYearFromNow as Date,
                                                                 calendars: nil)
        
        // 述語にマッチする全てのイベントをフェッチ.
        let events = myEventStore.events(matching: predicate) 
        
//        print(events)
        
        var eventItems = [String]()

        if !events.isEmpty {
            for i in events{
                print(i.title)
                print(i.startDate)
                print(i.endDate)
                
                // 配列に格納.
                eventItems += ["\(i.title): \(i.startDate) * \(i.endDate)"]
            }
        }
        print(eventItems)
        
        // 発見したイベントを格納する配列を生成.
 }
}
