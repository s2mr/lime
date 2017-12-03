//
//  ChatRoomRepository.swift
//  lime
//
//  Created by 下村一将 on 2017/10/26.
//  Copyright © 2017 kazu. All rights reserved.
//

import RxSwift
import SkyWay

public protocol ChatRoomRepository {
	func getChatRoom(index: Int) -> Observable<ChatRoomEntity>
	func sendChat(chat: ChatEntity) -> Observable<ChatRoomEntity>
	func viewWillDissapear()
	func callButtonTapped()
	func setStream(local: SKWVideo, remote: SKWVideo)
}

struct ChatRoomRepositoryImpl: ChatRoomRepository {
	private let dataStore: ChatRoomDataStore
	let chatRepository: ChatRepository
	
	public init(dataStore: ChatRoomDataStore) {
		self.dataStore = dataStore
		self.chatRepository = ChatRepositoryImpl(chatRoomDataStore: dataStore)
	}
	
	func getChatRoom(index: Int) -> Observable<ChatRoomEntity> {
		return dataStore.getChatRoom(index: index)
	}
	
	func sendChat(chat: ChatEntity) -> Observable<ChatRoomEntity> {
		let success = chatRepository.send(chat)
		if success {
			print("SEND")
		} else {
			print("NOT SEND")
		}
		
		return dataStore.sendChat(chat: chat)
	}
	
	func viewWillDissapear() {
		if chatRepository.disconnect() {
			print("success chatRepository.disconnect()")
		} else {
			print("not success chatRepository.disconnect()")
		}
	}
	
	func callButtonTapped() {
		chatRepository.call()
	}
	
	func setStream(local: SKWVideo, remote: SKWVideo) {
		chatRepository.setStream(local: local, remote: remote)
	}
}

