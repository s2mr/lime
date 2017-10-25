//
//  ChatRoomListWireframe.swift
//  lime
//
//  Created by 下村一将 on 2017/10/19.
//  Copyright © 2017 kazu. All rights reserved.
//

import Foundation

protocol ChatRoomListWireframe: class {
	weak var viewController: ChatRoomListViewController? { get set }
	
	func showChatRoom()
}

class ChatRoomListWireframeImpl: ChatRoomListWireframe {
	var viewController: ChatRoomListViewController?
	
	func showChatRoom() {
		
		let nextViewController = ChatRoomBuilder().build()
		viewController?.navigationController?.pushViewController(nextViewController, animated: true)
		
	}
}
