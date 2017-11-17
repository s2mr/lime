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
//		for i in 1...10000 {
//			chats.append(ChatEntity(text: "りぷらい\(i)", time: "12:33", chatRoomId: 0, speakerId: 2))
//			chats.append(ChatEntity(text: "じぶんのちゃっと\(i)", time: "12:33", chatRoomId: 0, speakerId: 10))
//		}
		chats.append(ChatEntity(text: "いっつも本読んでるね", time: "12:43", chatRoomId: 0, speakerId: 10))
		
		let friend = UserEntity(userId: "userId", screenName: "たろー", name: "name", statusText: "nemui")
		chatRoom = ChatRoomEntity(id: 1, friend: friend, currentText: "currentTxt", chats: chats)
	}
	
	func getChatRoom() -> Observable<ChatRoomEntity> {
		return Observable.create({ (observer) -> Disposable in
			observer.onNext(self.chatRoom)
			
//			var count = 0
//			Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { timer in
//				
//				if !timer.isValid {
//					timer.fire()
//				}
//				self.chatRoom.chats.append(ChatEntity(text: "じぶんのテキスト", time: "12:33", chatRoomId: 0, speakerId: 10))
//				self.chatRoom.chats.append(ChatEntity(text: "あいてのテキスト", time: "12:33", chatRoomId: 0, speakerId: 2))
//				observer.onNext(self.chatRoom)
//				count += 1
//			})
			
			return Disposables.create()
		})
	}
	
	
	func sendChat(chat: ChatEntity) -> Observable<ChatRoomEntity> {
		return Observable.create( {observer in
			self.chatRoom.chats.append(chat)
			observer.onNext(self.chatRoom)
			// サーバに送信
			self.api.send(LimeAPI.ChatSendRequest(chat: chat))
				.subscribe{print($0)}
				.disposed(by: self.disposeBag)
			
			//返信ボット
			ChatAPI().sendChat(chatText: chat.text)
				.subscribe(onNext: { str in
					let reply = ChatEntity(text: str, time: chat.time, chatRoomId: chat.chatRoomId, speakerId: 2)
					self.chatRoom.chats.append(reply)
					
					observer.onNext(self.chatRoom)
				})
				.disposed(by: self.disposeBag)
			
			return Disposables.create()
		})
	}
}
