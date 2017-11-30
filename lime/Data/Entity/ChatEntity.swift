//
//  ChatEntity.swift
//  lime
//
//  Created by 下村一将 on 2017/10/26.
//  Copyright © 2017 kazu. All rights reserved.
//

import Foundation

public class ChatEntity:NSObject, NSCoding {
	var text = ""
	var time = ""
	var chatRoomId: Int
	var speakerId: Int
	//    var userType: UserType
	
	public func encode(with aCoder: NSCoder) {
		aCoder.encode(self.text, forKey: "text")
		aCoder.encode(self.time, forKey: "time")
		aCoder.encode(self.chatRoomId, forKey: "chatRoomId")
		aCoder.encode(self.speakerId, forKey: "speakerId")
	}
	
	public required init?(coder aDecoder: NSCoder) {
		self.text = aDecoder.decodeObject(forKey: "text") as! String
		self.time = aDecoder.decodeObject(forKey: "time") as! String
		self.chatRoomId = aDecoder.decodeInteger(forKey: "chatRoomId")
		self.speakerId = aDecoder.decodeInteger(forKey: "speakerId")
	}
	
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
