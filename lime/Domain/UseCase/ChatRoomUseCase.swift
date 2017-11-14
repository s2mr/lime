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
	func sendChat(chat: ChatEntity) -> Observable<ChatRoomModel>
	func getAccountInfo() -> Observable<AccountEntity>
}

class ChatRoomUseCaseImpl: ChatRoomUseCase {
	private let chatRoomRepository: ChatRoomRepository
	private let accountRepository: AccountRepository
	
	public init(chatRoomRepository: ChatRoomRepository, accountRepository: AccountRepository) {
		self.chatRoomRepository = chatRoomRepository
		self.accountRepository = accountRepository
	}
	
	func loadChatRoom() -> Observable<ChatRoomModel> {
		return chatRoomRepository.getChatRoom()
			.map(translator: ChatRoomTranslator())
	}
	
	func sendChat(chat: ChatEntity) -> Observable<ChatRoomModel> {
		return chatRoomRepository.sendChat(chat: chat)
			.map(translator: ChatRoomTranslator())
	}
	
	func getAccountInfo() -> Observable<AccountEntity> {
		return accountRepository.getAccountInfo()
	}
}
