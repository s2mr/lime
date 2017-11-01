//
//  FriendListTranslator.swift
//  lime
//
//  Created by 下村一将 on 2017/10/18.
//  Copyright © 2017 kazu. All rights reserved.
//

import Foundation

struct FriendListTranslator: Translator {
	typealias Input = [UserEntity]
	typealias Output = FriendListModel
	
	func translate(_ entities: [UserEntity]) throws -> FriendListModel {
		var friendListModel = FriendListModel()
		entities.forEach { entity -> () in
			let friendModel = FriendModel(friendModel: entity)
			friendListModel.friendList.append(friendModel)
		}
		return friendListModel
	}
}
