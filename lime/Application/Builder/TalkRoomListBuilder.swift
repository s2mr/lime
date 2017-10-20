//
//  TalkRoomListBuilder.swift
//  lime
//
//  Created by 下村一将 on 2017/10/19.
//  Copyright © 2017 kazu. All rights reserved.
//

import UIKit

struct TalkRoomListBuilder {
	func build() -> UIViewController {
		let wireframe = TalkRoomListWireframeImpl()
		let viewController = UIStoryboard(name: "TalkRoomList", bundle: nil).instantiateInitialViewController() as! TalkRoomListViewController
		
		let presenter = TalkRoomListPresenterImpl(wireframe: wireframe)
		
		viewController.inject(presenter: presenter)
		
		wireframe.viewController = viewController
		
		return viewController
	}
}
