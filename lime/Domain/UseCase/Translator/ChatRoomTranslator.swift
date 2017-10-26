//
//  ChatRoomTranslator.swift
//  lime
//
//  Created by 下村一将 on 2017/10/26.
//  Copyright © 2017 kazu. All rights reserved.
//

import Foundation

struct ChatRoomTranslator: Translator {
	typealias Input = ChatRoomEntity
	typealias Output = ChatRoomModel
	
	func translate(_ entity: ChatRoomEntity) throws -> ChatRoomModel {
		let chatRoomModel: ChatRoomModel = ChatRoomModel(chatRoomModel: entity)
//		chatRoomModel.chats = entity.chats
//		chatRoomModel.currentText = entity.currentText
//		chatRoomModel.userScreenName = entity.friend.screenName
		return chatRoomModel
	}
}

