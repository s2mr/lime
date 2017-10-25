//
//  ChatRoomListTranslator.swift
//  lime
//
//  Created by 下村一将 on 2017/10/21.
//  Copyright © 2017 kazu. All rights reserved.
//

import Foundation

struct ChatRoomListTranslator: Translator {
	typealias Input = [ChatRoomEntity]
	typealias Output = ChatRoomListModel
	
	func translate(_ entity: [ChatRoomEntity]) throws -> ChatRoomListModel {
		var chatRoomListModel: ChatRoomListModel = ChatRoomListModel()
		entity.forEach { entity -> () in
			let chatRoomModel = ChatRoomModel(chatRoomModel: entity)
			chatRoomListModel.chatRoomList.append(chatRoomModel)
		}
		return chatRoomListModel
	}
}
