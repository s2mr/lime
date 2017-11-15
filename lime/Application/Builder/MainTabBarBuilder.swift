//
//  MainTabBarBuilder.swift
//  lime
//
//  Created by 下村一将 on 2017/10/17.
//  Copyright © 2017 kazu. All rights reserved.
//

import UIKit

struct MainTabBarBuilder {
	func build() -> UITabBarController {
		let wireframe = MainTabBarWireframeImpl()
		
		let tabBarController = UIStoryboard(name: "MainTabBar", bundle: nil).instantiateInitialViewController() as! MainTabBarController
		
		let flViewController = FriendListBuilder().build()
		let trViewController = ChatRoomListBuilder().build()
		
		flViewController.title = "Friends"
		trViewController.title = "Chats"
		
		let navCon = UINavigationController(rootViewController: trViewController)
		navCon.navigationBar.barTintColor = UIColor(displayP3Red: 38/255, green: 49/255, blue: 71/255, alpha: 0)
		navCon.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
		navCon.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "5", style: .plain, target: nil, action: nil)
		navCon.navigationBar.tintColor = UIColor.white
		
		tabBarController.viewControllers = [flViewController,
		                                    navCon]
		
		let presenter = MainTabBarPresenterImpl(wireframe: wireframe)
		tabBarController.inject(presenter: presenter)
		
		wireframe.mainTabBarController = tabBarController // 何してんだろう
		
		return tabBarController
	}
}
