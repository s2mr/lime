//
//  TalkRoomListUseCase.swift
//  lime
//
//  Created by 下村一将 on 2017/10/21.
//  Copyright © 2017 kazu. All rights reserved.
//

import Foundation
import RxSwift

protocol TalkRoomListUseCase {
	func loadTalkRoomList() -> Observable<TalkRoomListModel>
}

struct TalkRoomListUseCaseImpl: TalkRoomListUseCase {
	private let talkRoomListRepository: TalkRoomListRepository
	
	public init(talkRoomListRepository: TalkRoomListRepository) {
		self.talkRoomListRepository = talkRoomListRepository
	}
	
	func loadTalkRoomList() -> Observable<TalkRoomListModel> {
		return talkRoomListRepository.getTalkRoomList()
			.map(translator: TalkRoomListTranslator())
	}
}

