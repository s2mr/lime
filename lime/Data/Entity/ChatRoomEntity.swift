//
//  ChatRoomEntity.swift
//  lime
//
//  Created by 下村一将 on 2017/10/21.
//  Copyright © 2017 kazu. All rights reserved.
//

public struct ChatRoomEntity {
	var friend: FriendEntity
	var currentText = ""
	var chats: [ChatEntity]
	
	public init(friend: FriendEntity, currentText: String, chats: [ChatEntity]) {
		self.friend = friend
		self.currentText = currentText
		self.chats = chats
	}
}

