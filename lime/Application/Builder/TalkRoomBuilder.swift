//
//  TalkRoomBuilder.swift
//  lime
//
//  Created by 下村一将 on 2017/10/19.
//  Copyright © 2017 kazu. All rights reserved.
//

import UIKit

struct TalkRoomBuilder {
	func build() -> UIViewController {
		let wireframe = TalkRoomWireframeImpl()
		let viewController = UIStoryboard(name: "TalkRoom", bundle: nil).instantiateInitialViewController() as! TalkRoomViewController
		
		wireframe.viewController = viewController
		
		return viewController
	}
}
