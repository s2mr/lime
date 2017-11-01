//
//  FriendListDataStore.swift
//  lime
//
//  Created by 下村一将 on 2017/10/18.
//  Copyright © 2017 kazu. All rights reserved.
//

import RxSwift
import Alamofire

public protocol FriendListDataStore {
	// FIXME: use User
	func getFriendList() -> Observable<[UserEntity]>
}

struct FriendListDataStoreImpl: FriendListDataStore {
	private let api = LimeAPI()
	
	func getFriendList() -> Observable<[UserEntity]> {
		return api.send(LimeAPI.FriendsRequest())
			.map{ $0.users }
	}
}
