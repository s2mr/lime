//
//  MainTabBarBuilder.swift
//  lime
//
//  Created by 下村一将 on 2017/10/17.
//  Copyright © 2017 kazu. All rights reserved.
//

import Foundation
import UIKit

struct MainTabBarBuilder {
	func build() -> UITabBarController {
		let wireframe = MainTabBarWireframeImpl()
		
		let tabBarController = UIStoryboard(name: "MainTabBar", bundle: nil).instantiateInitialViewController() as! MainTabBarController
		
		
		let flViewController = UIStoryboard(name: "FriendList", bundle: nil).instantiateInitialViewController() as! FriendListViewController
		tabBarController.viewControllers = [flViewController]
		
		wireframe.mainTabBarController = tabBarController

		return tabBarController
	}
}
