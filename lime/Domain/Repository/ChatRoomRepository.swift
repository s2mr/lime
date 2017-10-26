//
//  ChatRoomRepository.swift
//  lime
//
//  Created by 下村一将 on 2017/10/26.
//  Copyright © 2017 kazu. All rights reserved.
//

import RxSwift

public protocol ChatRoomRepository {
	func getChatRoom() -> Observable<ChatRoomEntity>
}

struct ChatRoomRepositoryImpl: ChatRoomRepository {
	private let dataStore: ChatRoomDataStore
	
	public init(dataStore: ChatRoomDataStore) {
		self.dataStore = dataStore
	}
	
	func getChatRoom() -> Observable<ChatRoomEntity> {
		return dataStore.getChatRoom()
	}
}

