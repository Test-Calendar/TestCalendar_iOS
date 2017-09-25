////
////  FirstViewController.swift
////  EventKit01
////
//
//import UIKit
//import EventKit
//import RealmSwift
//
//class User: Object {
//    dynamic var id = 1
//    dynamic var name = ""
//}
//
//
//class TestingViewController: UIViewController {
//    
//    var myEventStore: EKEventStore!
//    var myEvents: NSArray!
//    var myTargetCalendar: EKCalendar!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()        
//        // EventStoreを生成する.
//        myEventStore = EKEventStore()
//        
//        // ユーザーにカレンダーの使用の許可を求める.
//        allowAuthorization()
//        
//        // Buttonを生成する.
//        let myButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
//        myButton.setTitle("getEvent", for: UIControlState.normal)
//        myButton.setTitleColor(UIColor.white, for: UIControlState.normal)
//        myButton.backgroundColor = UIColor.red
//        myButton.layer.masksToBounds = true
//        myButton.layer.cornerRadius = 50.0
//        myButton.center = self.view.center
//        myButton.addTarget(self, action: #selector(TestingViewController.onClickMyButton(sender:)), for: UIControlEvents.touchUpInside)
//        
//        // Buttonをviewに追加.
//        self.view.addSubview(myButton)
//    }
//    
//    /*
//     認証ステータスを取得.
//     */
//    func getAuthorization_status() -> Bool {
//        
//        // ステータスを取得.
//        let status: EKAuthorizationStatus = EKEventStore.authorizationStatus(for: EKEntityType.event)
//        
//        // ステータスを表示 許可されている場合のみtrueを返す.
//        switch status {
//        case EKAuthorizationStatus.notDetermined:
//            print("NotDetermined")
//            return false
//            
//        case EKAuthorizationStatus.denied:
//            print("Denied")
//            return false
//            
//        case EKAuthorizationStatus.authorized:
//            print("Authorized")
//            return true
//            
//        case EKAuthorizationStatus.restricted:
//            print("Restricted")
//            return false
//            
//        default:
//            print("error")
//            return false
//        }
//    }
//    
//    /*
//     認証許可.
//     */
//    func allowAuthorization() {
//        
//        // 許可されていなかった場合、認証許可を求める.
//        if getAuthorization_status() {
//            return
//        } else {
//            
//            // ユーザーに許可を求める.
//            myEventStore.requestAccess(to: EKEntityType.event, completion: {
//                (granted , error) -> Void in
//                
//                // 許可を得られなかった場合アラート発動.
//                if granted {
//                    return
//                }
//                else {
//                    
//                    // メインスレッド 画面制御. 非同期.
//                    DispatchQueue.main.async {
//                        let myAlert = UIAlertController(title: "許可されませんでした", message: "Privacy->App->Reminderで変更してください", preferredStyle: UIAlertControllerStyle.alert)
//                        
//                        // アラートアクション.
//                        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
//                        
//                        myAlert.addAction(okAction)
//                        self.present(myAlert, animated: true, completion: nil)
//
//                    }
////                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
////                        
////                        // アラート生成.
////                        let myAlert = UIAlertController(title: "許可されませんでした", message: "Privacy->App->Reminderで変更してください", preferredStyle: UIAlertControllerStyle.alert)
////                        
////                        // アラートアクション.
////                        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
////                        
////                        myAlert.addAction(okAction)
////                        self.presentViewController(myAlert, animated: true, completion: nil)
////                    })
//                }
//            })
//        }
//    }
//    
