//
//  TalkRoomListTranslator.swift
//  lime
//
//  Created by 下村一将 on 2017/10/21.
//  Copyright © 2017 kazu. All rights reserved.
//

import Foundation

struct TalkRoomListTranslator: Translator {
	typealias Input = [TalkRoomEntity]
	typealias Output = TalkRoomListModel
	
	func translate(_ entity: [TalkRoomEntity]) throws -> TalkRoomListModel {
		var talkRoomListModel: TalkRoomListModel = TalkRoomListModel()
		entity.forEach { entity -> () in
			let talkRoomModel = TalkRoomModel(talkRoomModel: entity)
			talkRoomListModel.talkRoomList.append(talkRoomModel)
		}
		return talkRoomListModel
	}
}
