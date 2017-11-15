//
//  ChatRoomEntity.swift
//  lime
//
//  Created by 下村一将 on 2017/10/21.
//  Copyright © 2017 kazu. All rights reserved.
//

import Unbox

public struct ChatRoomsEntity: Unboxable {
	var chatRooms: [ChatRoomEntity]
	
	public init(unboxer: Unboxer) throws {
		chatRooms = try unboxer.unbox(key: "chatRooms")
	}
}

public struct ChatRoomEntity: Unboxable {
	var id: Int
	var friend: UserEntity
	var currentText = ""
	var chats: [ChatEntity]
	
	public init(id: Int, friend: UserEntity, currentText: String, chats: [ChatEntity]) {
		self.id = id
		self.friend = friend
		self.currentText = currentText
		self.chats = chats
	}
	
	public init(unboxer: Unboxer) throws {
		self.id = try unboxer.unbox(key: "id")
		self.friend = try unboxer.unbox(key: "user")
		self.currentText = try unboxer.unbox(key: "currentText")
		self.chats = []
	}
	
	public func recentTime() -> String? {
		return self.chats.last?.time
	}
}

