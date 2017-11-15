//
//  ChatRoomDataStore.swift
//  lime
//
//  Created by 下村一将 on 2017/10/26.
//  Copyright © 2017 kazu. All rights reserved.
//

import RxSwift

public protocol ChatRoomDataStore {
	func getChatRoom() -> Observable<ChatRoomEntity>
	func sendChat(chat: ChatEntity) -> Observable<ChatRoomEntity>
}

class ChatRoomDataStoreImpl: ChatRoomDataStore {
	var chatRoom: ChatRoomEntity
	let api = LimeAPI()
	let disposeBag = DisposeBag()
	
	init() {
		var chats: [ChatEntity] = []
		chats.append(ChatEntity(text: "今何してる？", time: "12:23", chatRoomId: 0, speakerId: 10))
		chats.append(ChatEntity(text: "本読んでたよ〜", time: "12:33", chatRoomId: 0, speakerId: 2))
		chats.append(ChatEntity(text: """
この本まじ面白くて、
読み出すと本当止まらないんだよね笑
今度かそっか？😉
""", time: "12:33", chatRoomId: 0, speakerId: 2))
		chats.append(ChatEntity(text: "いっつも本読んでるね", time: "12:43", chatRoomId: 0, speakerId: 10))
		let friend = UserEntity(userId: "userId", screenName: "screenName", name: "name", statusText: "nemui")
		chatRoom = ChatRoomEntity(id: 1, friend: friend, currentText: "currentTxt", chats: chats)
	}
	
	func getChatRoom() -> Observable<ChatRoomEntity> {
		return Observable.create({ (observer) -> Disposable in
			observer.onNext(self.chatRoom)
			return Disposables.create()
		})
	}
	
	func sendChat(chat: ChatEntity) -> Observable<ChatRoomEntity> {
		self.chatRoom.chats.append(chat)
		
		// サーバに送信
		api.send(LimeAPI.ChatSendRequest(chat: chat))
			.subscribe{print($0)}
			.disposed(by: disposeBag)
		
		return Observable.create {
			$0.onNext(self.chatRoom)
			return Disposables.create()
		}
	}
}
