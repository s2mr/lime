//
//  ChatEntity.swift
//  lime
//
//  Created by 下村一将 on 2017/10/26.
//  Copyright © 2017 kazu. All rights reserved.
//

import Foundation
import UIKit

public class ChatEntity:NSObject, NSCoding {
	var text = ""
	var time = ""
	var chatRoomId: Int
	var uuid: String
	//    var userType: UserType
	
	public func encode(with aCoder: NSCoder) {
		aCoder.encode(self.text, forKey: "text")
		aCoder.encode(self.time, forKey: "time")
		aCoder.encode(self.chatRoomId, forKey: "chatRoomId")
		aCoder.encode(self.uuid, forKey: "uuid")
	}
	
	public required init?(coder aDecoder: NSCoder) {
		self.text = aDecoder.decodeObject(forKey: "text") as! String
		self.time = aDecoder.decodeObject(forKey: "time") as! String
		self.chatRoomId = aDecoder.decodeInteger(forKey: "chatRoomId")
		self.uuid = aDecoder.decodeObject(forKey: "uuid") as! String
	}
	
	public init(text: String, time: String, chatRoomId: Int, uuid: String) {
		self.text = text
		self.time = time
		self.chatRoomId = chatRoomId
		self.uuid = uuid
		//        self.userType = userType
	}
	
	public func isMyChat() -> Bool {
		return uuid == UIDevice.current.identifierForVendor?.uuidString
	}
}

public enum UserType {
	case I
	case You
}
