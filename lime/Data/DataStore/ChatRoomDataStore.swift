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
		let chat1 = ChatEntity(text: "text1", time: "12:23", userType: UserType.You)
		let chat2 = ChatEntity(text: "text2", time: "12:33", userType: UserType.I)
		let chat3 = ChatEntity(text: "text3", time: "12:43", userType: UserType.You)
		let chats = [chat1,chat2, chat3]
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
