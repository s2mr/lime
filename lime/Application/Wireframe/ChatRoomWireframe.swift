//
//  ChatRoomWireframe.swift
//  lime
//
//  Created by 下村一将 on 2017/10/19.
//  Copyright © 2017 kazu. All rights reserved.
//

import Foundation

protocol ChatRoomWireframe: class {
	weak var viewController: ChatRoomViewController? { get set }
}

class ChatRoomWireframeImpl: ChatRoomWireframe {
	var viewController: ChatRoomViewController?
}
