//
//  ChatRoomRepository.swift
//  lime
//
//  Created by 下村一将 on 2017/10/26.
//  Copyright © 2017 kazu. All rights reserved.
//

import RxSwift

public protocol ChatRoomRepository {
	func getChatRoom(index: Int) -> Observable<ChatRoomEntity>
	func sendChat(chat: ChatEntity) -> Observable<ChatRoomEntity>
}

struct ChatRoomRepositoryImpl: ChatRoomRepository {
	private let dataStore: ChatRoomDataStore
	
	public init(dataStore: ChatRoomDataStore) {
		self.dataStore = dataStore
	}
	
	func getChatRoom(index: Int) -> Observable<ChatRoomEntity> {
		return dataStore.getChatRoom(index: index)
	}
	
	func sendChat(chat: ChatEntity) -> Observable<ChatRoomEntity> {
		return dataStore.sendChat(chat: chat)
	}
}

