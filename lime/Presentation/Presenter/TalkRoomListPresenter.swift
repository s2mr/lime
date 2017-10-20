//
//  TalkRoomListPresenter.swift
//  lime
//
//  Created by 下村一将 on 2017/10/20.
//  Copyright © 2017 kazu. All rights reserved.
//

import Foundation

protocol TalkRoomListPresenter {
	func selectCell()
}

class TalkRoomListPresenterImpl: TalkRoomListPresenter {
	
	let wireframe: TalkRoomListWireframe
	
	public required init(wireframe: TalkRoomListWireframe) {
		self.wireframe = wireframe
	}
	
	func selectCell() {
		wireframe.showTalkRoom()
	}
}
