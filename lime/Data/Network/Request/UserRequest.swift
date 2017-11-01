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
	struct FriendsRequest: LimeAPIRequest {
	}
}

extension LimeAPI.FriendsRequest {
	typealias Response = UsersEntity
	
	var path: String {
		return "/friends"
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
