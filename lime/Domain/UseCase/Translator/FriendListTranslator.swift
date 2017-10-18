//
//  FriendListTranslator.swift
//  lime
//
//  Created by 下村一将 on 2017/10/18.
//  Copyright © 2017 kazu. All rights reserved.
//

import Foundation

struct FriendListTranslator: Translator {
	typealias Input = [FriendEntity]
	typealias Output = FriendListModel
	
	func translate(_ entities: [FriendEntity]) throws -> FriendListModel {
		var friendListModel = FriendListModel()
		entities.forEach { entitiy -> () in
			let friendModel = FriendModel(friendModel: entitiy)
			friendListModel.friendList.append(friendModel)
		}
		return friendListModel
	}
}
