//

//  LimeAPI.swift
//  lime
//
//  Created by 下村一将 on 2017/10/29.
//  Copyright © 2017 kazu. All rights reserved.
//

import Foundation
import Alamofire

protocol LimeAPIRespondable: APIRespondable {
	var keyPathForResponse: String? { get }
}

extension LimeAPIRespondable {
	// protocol extension
	var keyPathForResponse: String? {
		return "data"
	}
}

extension LimeAPIRespondable {
	//Todo: use unbox
	func response(from json: Any?) throws -> Response {
		print("[response]", json!)
		
		return json as! Self.Response
	}
}

protocol LimeAPIRequest: APIRequest, LimeAPIRespondable {}

public class LimeAPI: API {
	var sessionConfiguration: URLSessionConfiguration
	var manager: SessionManager
	let baseURL: URL
	
	init(configuration: LimeAPI.Configuration = .default) {
		self.sessionConfiguration = configuration.sessionConfiguration
		self.manager = SessionManager(configuration: sessionConfiguration)
		self.baseURL = configuration.baseURL
	}
	
	func send<Req: LimeAPIRequest>(_ request: Req) {
//		let manager = self.manager
		
		let url: URL = baseURL.appendingPathComponent(request.path)
		
		Alamofire.request(url, method: request.method, parameters: request.parameters,
		                  encoding: request.encoding, headers: request.headers)
			.responseString(completionHandler: { response in
				
				print("[RESPONSE]", response.value!)
			})
	}
}
