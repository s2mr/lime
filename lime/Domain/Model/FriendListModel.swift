//
//  FriendListModel.swift
//  lime
//
//  Created by 下村一将 on 2017/10/18.
//  Copyright © 2017 kazu. All rights reserved.
//

import Foundation

struct FriendListModel {
	var friendList: [FriendModel] = []
}

struct FriendModel: FriendListViewModel {
	var name: String
	var screenName: String
	var userId: String
	var statusText: String
	
	init(friendModel: UserEntity) {
		name = friendModel.name
		screenName = friendModel.screenName
		userId = friendModel.userId
		statusText = friendModel.statusText
	}
}
