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
		
		tabBarController.viewControllers = [flViewController]
		
		let presenter = MainTabBarPresenterImpl(wireframe: wireframe)
		tabBarController.inject(presenter: presenter)
		
		wireframe.mainTabBarController = tabBarController // 何してんだろう
		
		return tabBarController
	}
}
