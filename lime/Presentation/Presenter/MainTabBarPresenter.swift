//
//  MainTabBarPresenter.swift
//  lime
//
//  Created by 下村一将 on 2017/10/17.
//  Copyright © 2017 kazu. All rights reserved.
//

import Foundation

protocol MainTabBarPresenter {
}

class MainTabBarPresenterImpl: MainTabBarPresenter {
	
	let wireframe: MainTabBarWireframe
	
	public required init(wireframe: MainTabBarWireframe) {
		self.wireframe = wireframe
	}
}
