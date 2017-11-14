//
//  ChatSendRequest.swift
//  lime
//
//  Created by 下村一将 on 2017/11/11.
//  Copyright © 2017年 kazu. All rights reserved.
//

import Foundation
import Alamofire

public extension LimeAPI{
	struct ChatSendRequest {
		let chat: ChatEntity
	}
}

extension LimeAPI.ChatSendRequest: LimeAPIRequest {
	typealias Response = Void
	
	var path: String {
		return "/chat"
	}
	
	var method: HTTPMethod {
		return .post
	}
	
	var headers: HTTPHeaders? {
		return nil
	}
	
	var parameters: Parameters? {
		return ["text" : chat.text,
				"time" : chat.time,
				"chat-room-id": chat.chatRoomId,
				"speaker-id": chat.speakerId,
		]
	}
}
