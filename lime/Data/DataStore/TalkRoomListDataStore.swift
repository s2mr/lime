//
//  TalkRoomListDataStore.swift
//  lime
//
//  Created by 下村一将 on 2017/10/21.
//  Copyright © 2017 kazu. All rights reserved.
//

import RxSwift

public protocol TalkRoomListDataStore {
	func getTalkRoomList() -> Observable<[TalkRoomEntity]>
}

struct TalkRoomListDataStoreImpl: TalkRoomListDataStore {
	// TODO: get by user
	func getTalkRoomList() -> Observable<[TalkRoomEntity]> {
		let friend = FriendEntity(userId: "", screenName: "screenName1", name: "name")
		let talkRoom = TalkRoomEntity(friend: friend, currentText: "最近眠い")
		let friend1 = FriendEntity(userId: "", screenName: "screenName2", name: "name")
		let talkRoom1 = TalkRoomEntity(friend: friend1, currentText: "最近眠い")
		let tr = [talkRoom, talkRoom1]
		
		return Observable.create({ (observer) -> Disposable in
			observer.onNext(tr)
			return Disposables.create()
		})
	}
	
	
}

