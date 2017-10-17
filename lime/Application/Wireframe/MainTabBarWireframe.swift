//
//  MainTabBarWireframe.swift
//  lime
//
//  Created by 下村一将 on 2017/10/17.
//  Copyright © 2017 kazu. All rights reserved.
//

import Foundation

protocol MainTabBarWireframe {
	weak var mainTabBarController: MainTabBarController? {get set}
}

class MainTabBarWireframeImpl: MainTabBarWireframe {
	var mainTabBarController: MainTabBarController?
}
