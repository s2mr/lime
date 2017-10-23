//
//  TalkRoomListRepository.swift
//  lime
//
//  Created by 下村一将 on 2017/10/21.
//  Copyright © 2017 kazu. All rights reserved.
//

import RxSwift

public protocol TalkRoomListRepository {
	func getTalkRoomList() -> Observable<[TalkRoomEntity]>
}

struct TalkRoomListRepositoryImpl: TalkRoomListRepository {
	private let dataStore: TalkRoomListDataStore
	
	public init(dataStore: TalkRoomListDataStore) {
		self.dataStore = dataStore
	}
	
	func getTalkRoomList() -> Observable<[TalkRoomEntity]> {
		return dataStore.getTalkRoomList()
	}
}

