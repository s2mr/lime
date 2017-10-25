//
//  ChatRoomListDataStore.swift
//  lime
//
//  Created by 下村一将 on 2017/10/21.
//  Copyright © 2017 kazu. All rights reserved.
//

import RxSwift

public protocol ChatRoomListDataStore {
	func getChatRoomList() -> Observable<[ChatRoomEntity]>
}

struct ChatRoomListDataStoreImpl: ChatRoomListDataStore {
	// TODO: get by user
	func getChatRoomList() -> Observable<[ChatRoomEntity]> {
		let friend = FriendEntity(userId: "", screenName: "screenName1", name: "name")
		let chatRoom = ChatRoomEntity(friend: friend, currentText: "最近眠い")
		let friend1 = FriendEntity(userId: "", screenName: "screenName2", name: "name")
		let chatRoom1 = ChatRoomEntity(friend: friend1, currentText: "最近眠い")
		let tr = [chatRoom, chatRoom1]
		
		return Observable.create({ (observer) -> Disposable in
			observer.onNext(tr)
			return Disposables.create()
		})
	}
	
	
}

