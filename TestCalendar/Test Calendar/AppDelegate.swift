//
//  AppDelegate.swift
//  Test Calendar
//
//  Created by 山浦功 on 2017/08/30.
//  Copyright © 2017年 山浦功. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        UIApplication.shared.isStatusBarHidden = false
        
        
        
        let config = Realm.Configuration(
            // 新しいスキーマバージョンを設定します。以前のバージョンより大きくなければなりません。
            // （スキーマバージョンを設定したことがなければ、最初は0が設定されています）
            schemaVersion: 1,
            
            // マイグレーション処理を記述します。古いスキーマバージョンのRealmを開こうとすると
            // 自動的にマイグレーションが実行されます。
            migrationBlock: { migration, oldSchemaVersion in
                // 最初のマイグレーションの場合、`oldSchemaVersion`は0です
                if (oldSchemaVersion < 1) {
                    // 何もする必要はありません！
                    // Realmは自動的に新しく追加されたプロパティと、削除されたプロパティを認識します。
                    // そしてディスク上のスキーマを自動的にアップデートします。
                }else {
                    
                }
        })
        
        // デフォルトRealmに新しい設定を適用します
        Realm.Configuration.defaultConfiguration = config
        
        // Realmファイルを開こうとしたときスキーマバージョンが異なれば、
        // 自動的にマイグレーションが実行されます
        let realm = try! Realm() 

        
        
//        let fileManager = FileManager.default
//        do {
//            let url = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
//            if let enumerator = fileManager.enumerator(at: url, includingPropertiesForKeys: nil) {
//                while let fileURL = enumerator.nextObject() as? URL {
//                    try fileManager.removeItem(at: fileURL)
//                }
//            }
//
//        }  catch  {
//            print(error)
//        }
//       
//        autoreleasepool {
//            // all Realm usage here
//        }
//        let realmURL = Realm.Configuration.defaultConfiguration.fileURL!
//        let realmURLs = [
//            realmURL,
//            realmURL.appendingPathExtension("lock"),
//            realmURL.appendingPathExtension("note"),
//            realmURL.appendingPathExtension("management")
//        ]
//         print("おおおお")
//        let manager = FileManager.default
//        if let fileURL = Realm.Configuration.defaultConfiguration.fileURL {
//            try! FileManager.default.removeItem(at: fileURL)
//            print("keseta")
//        }
//        for URL in realmURLs {
//            do {
//                try FileManager.default.removeItem(at: URL)
//                print("おおおおお")
//            } catch {
//                 print("データエラーだよん")
//                // handle error
//            }
//        }

        
        // Inside your application(application:didFinishLaunchingWithOptions:)
//        
//            let config = Realm.Configuration(
//                // Set the new schema version. This must be greater than the previously used
//                // version (if you've never set a schema version before, the version is 0).
//                schemaVersion: 1,
//                
//                // Set the block which will be called automatically when opening a Realm with
//                // a schema version lower than the one set above
//                migrationBlock: { migration, oldSchemaVersion in
//                    // We haven’t migrated anything yet, so oldSchemaVersion == 0
//                    if (oldSchemaVersion < 1) {
//                        
//                        
//                        migration.enumerateObjects(ofType: Test.className()) { oldObject, newObject in
//                            // No-op.
//                            // dynamic properties are defaulting the new column to true
//                            // but the migration block is still needed
//                        }
//                        migration.enumerateObjects(ofType: Study.className()) { oldObject, newObject in
//                            // No-op.
//                            // dynamic properties are defaulting the new column to true
//                            // but the migration block is still needed
//                        }
//                        migration.enumerateObjects(ofType: Test.className()) { oldObject, newObject in
//                            // No-op.
//                            // dynamic properties are defaulting the new column to true
//                            // but the migration block is still needed
//                        }
//                    }else {
//                       
//                    }
//            })
//            
//            // Tell Realm to use this new configuration object for the default Realm
//            Realm.Configuration.defaultConfiguration = config
//        
//            // Now that we've told Realm how to handle the schema change, opening the file
//            // will automatically perform the migration
//            do {
//                _ = try Realm()
//            } catch let _ as NSError {
//                // print error
//            }
//            
//            
//            return true
//            
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

