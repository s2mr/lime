//
//  ChatRoomListRepository.swift
//  lime
//
//  Created by 下村一将 on 2017/10/21.
//  Copyright © 2017 kazu. All rights reserved.
//

import RxSwift

public protocol ChatRoomListRepository {
	func getChatRoomList() -> Observable<[ChatRoomEntity]>
}

struct ChatRoomListRepositoryImpl: ChatRoomListRepository {
	private let dataStore: ChatRoomListDataStore
	
	public init(dataStore: ChatRoomListDataStore) {
		self.dataStore = dataStore
	}
	
	func getChatRoomList() -> Observable<[ChatRoomEntity]> {
		return dataStore.getChatRoomList()
	}
}

