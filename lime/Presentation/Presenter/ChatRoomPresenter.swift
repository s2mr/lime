//
//  ChatRoomPresenter.swift
//  lime
//
//  Created by 下村一将 on 2017/10/26.
//  Copyright © 2017 kazu. All rights reserved.
//

import Foundation
import RxSwift

protocol ChatRoomPresenter {
	func loadChatRoom()
	func sendMessage(message: String)
}

class ChatRoomPresenterImpl: ChatRoomPresenter {
	
	weak var viewInput: ChatRoomViewInput?
	let wireframe: ChatRoomWireframe
	let useCase: ChatRoomUseCase
	
	fileprivate let disposeBag = DisposeBag()
	
	public required init(viewInput: ChatRoomViewInput, wireframe: ChatRoomWireframe, useCase: ChatRoomUseCase) {
		self.viewInput = viewInput
		self.useCase = useCase
		self.wireframe = wireframe
	}
	
	func loadChatRoom() {
		useCase.loadChatRoom()	
			.subscribe(
				onNext: { [weak self] chat in
					// Notice: chatRoomModelのラベルがないと'extra argument onerror in call'が出るぞ
					self?.loadedChatRoom(chatRoomModel: chat)
					//Todo
				}, onError: {
					print($0)
				}, onCompleted: nil, onDisposed: nil
			)
			.disposed(by: disposeBag)
	}
	
	func sendMessage(message: String) {
		self.wireframe.viewController?.bottomView.chatTextField.text = ""
		let date = Date()
		let calendar = Calendar.current
		useCase.sendChat(chat:
			ChatEntity(text: message,
                       time: "\(calendar.component(.hour, from: date)):\(calendar.component(.hour, from: date))", chatRoomId: 0, speakerId: 0))
			.subscribe(
				onNext: { [weak self] chatRoom in
					self?.loadedChatRoom(chatRoomModel: chatRoom)
				}
			)
			.disposed(by: disposeBag)
	}
}

extension ChatRoomPresenterImpl {
	fileprivate func loadedChatRoom(chatRoomModel: ChatRoomModel) {
		self.viewInput?.setChatRoom(chatRoomModel)
	}
}
