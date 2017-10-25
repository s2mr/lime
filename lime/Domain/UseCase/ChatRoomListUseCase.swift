//
//  ChatRoomListUseCase.swift
//  lime
//
//  Created by 下村一将 on 2017/10/21.
//  Copyright © 2017 kazu. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol ChatRoomListUseCase {
	func loadChatRoomList() -> Observable<ChatRoomListModel>
}

class ChatRoomListUseCaseImpl: ChatRoomListUseCase {
	private let chatRoomListRepository: ChatRoomListRepository
		
	public init(chatRoomListRepository: ChatRoomListRepository) {
		self.chatRoomListRepository = chatRoomListRepository
	}
	
	func loadChatRoomList() -> Observable<ChatRoomListModel> {
		return chatRoomListRepository.getChatRoomList()
			.map(translator: ChatRoomListTranslator())
	}
}

