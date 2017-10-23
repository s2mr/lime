//
//  TalkRoomListModel.swift
//  lime
//
//  Created by 下村一将 on 2017/10/21.
//  Copyright © 2017 kazu. All rights reserved.
//

import Foundation

struct TalkRoomListModel {
	var talkRoomList: [TalkRoomModel] = []
}

struct TalkRoomModel: TalkRoomViewModel {
	var userScreenName: String
	var date: String
	var currentText: String
	
	init(talkRoomModel: TalkRoomEntity) {
		self.currentText = talkRoomModel.currentText
		self.date = "Today"
		self.userScreenName = talkRoomModel.friend.screenName
	}
}

