//
//  ChatRoomsRequest.swift
//  lime
//
//  Created by 下村一将 on 2017/11/01.
//  Copyright © 2017 kazu. All rights reserved.
//

import Foundation
import Alamofire

public extension LimeAPI {
	struct ChatRoomsRequest {
	}
}

extension LimeAPI.ChatRoomsRequest: LimeAPIRequest {
	typealias Response = ChatRoomsEntity
	
	var path: String {
		return "/chatRooms"
	}
	
	var method: HTTPMethod {
		return .post
	}
	
	var headers: HTTPHeaders? {
		return nil
	}
	
	var parameters: Parameters? {
		return nil
	}
}
