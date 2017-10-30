//
//  User.swift
//  lime
//
//  Created by 下村一将 on 2017/10/29.
//  Copyright © 2017 kazu. All rights reserved.
//

import Foundation
import Alamofire

public extension LimeAPI {
	struct UserRequest: LimeAPIRequest {
		let id: Int
	}
}

extension LimeAPI.UserRequest {
	typealias Response = FriendEntity
	
	var path: String {
		return "/users"
	}
	
	var method: HTTPMethod {
		return .post
	}
	
	var headers: HTTPHeaders? {
		return nil
	}
	
	var parameters: Parameters? {
		return [
			"id": id
		]
	}
}
