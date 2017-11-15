//
//  AppDelegate.swift
//  lime
//
//  Created by 下村一将 on 2017/10/17.
//  Copyright © 2017 kazu. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		window?.rootViewController = MainTabBarBuilder().build()
		
		UIApplication.shared.statusBarStyle = .lightContent
		
		if #available(iOS 10.0, *) {
			//ios10
			let center = UNUserNotificationCenter.current()
			center.requestAuthorization(options: [.badge, .sound, .alert], completionHandler: { (granted, error) in
				if error != nil {
					return
				}
				if granted {
					debugPrint("通知許可")
					center.delegate = self
					
					DispatchQueue.main.async {
						application.registerForRemoteNotifications()
					}
				} else {
					debugPrint("通知拒否")
				}
			})
			
		} else {
			// ios9
			let settings = UIUserNotificationSettings(types: [.badge, .sound, .alert], categories: nil)
			UIApplication.shared.registerUserNotificationSettings(settings)
			UIApplication.shared.registerForRemoteNotifications()
		}
		return true
	}
	
	func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
		// そのままだと「32bit」という文字列なので以下の処理を行います
		let deviceTokenString: String = deviceToken.map { String(format: "%.2hhx", $0) }.joined()
		print("deviceTokenString \(deviceTokenString)")
//		util.setUserDefaultsObject(value: deviceTokenString, key: deviceToken) // これは自前
	}
	
	func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
		debugPrint("リモート通知の設定は拒否されました")
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

