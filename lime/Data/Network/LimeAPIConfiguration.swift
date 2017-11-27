//
//  LimeAPIConfiguration.swift
//  lime
//
//  Created by 下村一将 on 2017/10/29.
//  Copyright © 2017 kazu. All rights reserved.
//

import Foundation

extension LimeAPI {
	public struct Configuration {
		public var sessionConfiguration: URLSessionConfiguration
		public var baseURL: URL
	}
}

public extension LimeAPI.Configuration {
	static var `default`: LimeAPI.Configuration {
		let sessionConfiguration: URLSessionConfiguration = .default
		return LimeAPI.Configuration(sessionConfiguration: sessionConfiguration,
//		                             baseURL: URL(string: "https://lime-server-stg.herokuapp.com/api/v1")! )
                                    baseURL: URL(string: "http://localhost:3000/api/v1")! )
	}
}
