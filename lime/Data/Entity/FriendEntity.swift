//
//  FriendEntity.swift
//  lime
//
//  Created by 下村一将 on 2017/10/18.
//  Copyright © 2017 kazu. All rights reserved.
//


public struct FriendEntity {
	var userId		= ""
	var screenName	= ""
	var name		= ""
	
	public init(userId: String, screenName: String, name: String) {
		self.userId = userId
		self.screenName = screenName
		self.name = name
	}
}
