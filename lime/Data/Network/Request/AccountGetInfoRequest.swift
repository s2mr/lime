//
//  AccountGetInfoRequest.swift
//  lime
//
//  Created by 下村一将 on 2017/11/13.
//  Copyright © 2017年 kazu. All rights reserved.
//

import Foundation
import Alamofire

public extension LimeAPI {
	struct AccountGetInfoRequest {
		let uuid: String	
	}
}

extension LimeAPI.AccountGetInfoRequest: LimeAPIRequest {
	typealias Response = AccountEntity
	
	var path: String {
		return "/account"
	}
	
	var method: HTTPMethod {
		return .get
	}
	
	var headers: HTTPHeaders? {
		return nil
	}
	
	var parameters: Parameters? {
		return ["uuid": uuid]
	}
}
