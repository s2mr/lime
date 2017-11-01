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
}

struct ChatRoomDataStoreImpl: ChatRoomDataStore {
	func getChatRoom() -> Observable<ChatRoomEntity> {
		let friend = UserEntity(userId: "userId", screenName: "screenName", name: "name", statusText: "nemui")
		let chat1 = ChatEntity(text: "text1", time: "12:23", userType: UserType.You)
		let chat2 = ChatEntity(text: "text2", time: "12:33", userType: UserType.I)
		let chat3 = ChatEntity(text: "text3", time: "12:43", userType: UserType.You)
		let chatRoom = ChatRoomEntity(id: 1, friend: friend, currentText: "currentTxt", chats: [chat1,chat2,chat3])
		
		return Observable.create({ (observer) -> Disposable in
			observer.onNext(chatRoom)
			return Disposables.create()
		})
	}
}
