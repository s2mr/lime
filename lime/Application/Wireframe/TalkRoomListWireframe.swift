//
//  TalkRoomListWireframe.swift
//  lime
//
//  Created by 下村一将 on 2017/10/19.
//  Copyright © 2017 kazu. All rights reserved.
//

import Foundation

protocol TalkRoomListWireframe: class {
	weak var viewController: TalkRoomListViewController? { get set }
}

class TalkRoomListWireframeImpl: TalkRoomListWireframe {
	var viewController: TalkRoomListViewController?
	
	
}
