//
//  ChatEntity.swift
//  lime
//
//  Created by 下村一将 on 2017/10/26.
//  Copyright © 2017 kazu. All rights reserved.
//

import Foundation

public struct ChatEntity {
	var text = ""
	var time = ""
    var chatRoomId: Int
    var speakerId: Int
//    var userType: UserType
	
    public init(text: String, time: String, chatRoomId: Int, speakerId: Int) {
		self.text = text
		self.time = time
        self.chatRoomId = chatRoomId
        self.speakerId = speakerId
//        self.userType = userType
	}
    
    public func isMyChat() -> Bool {
        let myId = 10
        return speakerId == myId
    }
}

public enum UserType {
	case I
	case You
}
