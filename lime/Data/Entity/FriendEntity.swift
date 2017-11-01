//
//  FriendEntity.swift
//  lime
//
//  Created by 下村一将 on 2017/10/18.
//  Copyright © 2017 kazu. All rights reserved.
//

import Unbox

public struct FriendEntity {
	var userId		= ""
	var screenName	= ""
	var name		= ""
	var statusText	= ""
	
	public init(userId: String, screenName: String, name: String, statusText: String) {
		self.userId = userId
		self.screenName = screenName
		self.name = name
		self.statusText = statusText
	}
}

extension FriendEntity: Unboxable  {
	public init(unboxer: Unboxer) throws {
		self.userId = try unboxer.unbox(key: "")
		self.screenName = try unboxer.unbox(key: "")
		self.name = try unboxer.unbox(key: "")
		self.statusText = try unboxer.unbox(key: "")
	}
}
