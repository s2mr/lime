//

//  LimeAPI.swift
//  lime
//
//  Created by 下村一将 on 2017/10/29.
//  Copyright © 2017 kazu. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift
import Unbox

protocol LimeAPIRespondable: APIRespondable {
	var keyPathForResponse: String? { get }
}

extension LimeAPIRespondable {
	// protocol extension
	var keyPathForResponse: String? {
		return "data"
	}
	
	fileprivate func validateResponse(_ json: Any?) throws -> UnboxableDictionary {
		guard let json = json as? UnboxableDictionary else {
			throw UnboxError.invalidData
		}
		return json
	}
}

extension LimeAPIRespondable where Response: Unboxable {
	//Todo: use unbox
	func response(from json: Any?) throws -> Response {
		let json = try validateResponse(json)
		if let keyPath = keyPathForResponse {
			return try unbox(dictionary: json, atKeyPath: keyPath)
		} else {
			return try unbox(dictionary: json)
		}
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
	
	func send<Req: LimeAPIRequest>(_ request: Req) -> Observable<Req.Response> {
		let url: URL = baseURL.appendingPathComponent(request.path)
		
		return Observable<Req.Response>.create { observer -> Disposable in
			Alamofire.request(url, method: request.method, parameters: request.parameters,
			                  encoding: request.encoding, headers: request.headers)
				.responseJSON(completionHandler: { response in
					print(".responseJSON")
					switch response.result {
					case .success(let value):
						do {
							let res = try request.response(from: value)
							observer.onNext(res)
							observer.onCompleted()
						} catch let error {
							observer.onError(error)
						}
					case .failure(let error):
						observer.onError(error)
					}
				})
			
			return Disposables.create()
		}
	}
}
