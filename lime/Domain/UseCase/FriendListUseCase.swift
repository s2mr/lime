//
//  FriendListUseCase.swift
//  lime
//
//  Created by 下村一将 on 2017/10/18.
//  Copyright © 2017 kazu. All rights reserved.
//

import Foundation
import RxSwift

protocol FriendListUseCase {
	func loadFriendList() -> Observable<FriendListModel>
}

struct FriendListUseCaseImpl: FriendListUseCase {
	private let friendListRepository: FriendListRepository
	
	public init(friendListRepository: FriendListRepository) {
		self.friendListRepository = friendListRepository
	}
	
	func loadFriendList() -> Observable<FriendListModel> {
		return friendListRepository.getFriendList()
			.map(translator: FriendListTranslator())
	}
}
