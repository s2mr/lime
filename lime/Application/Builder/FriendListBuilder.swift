//
//  FriendListBuilder.swift
//  lime
//
//  Created by 下村一将 on 2017/10/17.
//  Copyright © 2017 kazu. All rights reserved.
//

import UIKit

struct FriendListBuilder {
	func build() -> FriendListViewController {
		let wireframe = FriendListWireframeImpl()
		let viewController = UIStoryboard(name: "FriendList", bundle: nil).instantiateInitialViewController() as! FriendListViewController
		
		let presenter = FriendListPresenterImpl(wireframe: wireframe)
		viewController.presenter = presenter
		
		wireframe.viewController = viewController // 何してんだろう
		
		return viewController
	}
}
