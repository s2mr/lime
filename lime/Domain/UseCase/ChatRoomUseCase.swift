//
//  ChatRoomUseCase.swift
//  lime
//
//  Created by 下村一将 on 2017/10/26.
//  Copyright © 2017 kazu. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol ChatRoomUseCase {
	func loadChatRoom() -> Observable<ChatRoomModel>
}

class ChatRoomUseCaseImpl: ChatRoomUseCase {
	private let chatRoomRepository: ChatRoomRepository
	
	public init(chatRoomRepository: ChatRoomRepository) {
		self.chatRoomRepository = chatRoomRepository
	}
	
	func loadChatRoom() -> Observable<ChatRoomModel> {
		return chatRoomRepository.getChatRoom()
			.map(translator: ChatRoomTranslator())
	}
}
