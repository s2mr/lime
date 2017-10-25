//
//  ChatRoomListPresenter.swift
//  lime
//
//  Created by 下村一将 on 2017/10/20.
//  Copyright © 2017 kazu. All rights reserved.
//

import Foundation
import RxSwift

protocol ChatRoomListPresenter {
	func selectCell()
	func loadChatRoomList()
}

class ChatRoomListPresenterImpl: ChatRoomListPresenter {
	
	weak var viewInput: ChatRoomListViewInput?
	let useCase: ChatRoomListUseCase
	let wireframe: ChatRoomListWireframe
	
	fileprivate let disposeBag = DisposeBag()
	
	public required init(viewInput: ChatRoomListViewInput, useCase: ChatRoomListUseCase, wireframe: ChatRoomListWireframe) {
		self.viewInput = viewInput
		self.useCase = useCase
		self.wireframe = wireframe
	}
	
	func selectCell() {
		wireframe.showChatRoom()
	}
	
	func loadChatRoomList() {
		useCase.loadChatRoomList()
			.subscribe(
				onNext: { [weak self] chatRoomListModel in
					NSLog("onNext")
					self?.loadedChatRoomListModel(chatRoomListModel: chatRoomListModel)
				},
				onError: { [weak self] error in
					NSLog("error")
				},
				onCompleted: nil, onDisposed: nil)
			.disposed(by: disposeBag)
		
		//TODO: status
	}
}

extension ChatRoomListPresenterImpl {
	fileprivate func loadedChatRoomListModel(chatRoomListModel: ChatRoomListModel) {
		DispatchQueue.main.async {
			self.viewInput?.setTalkListModel(chatRoomListModel)
			// TODO: status change, nodata
		}
	}
}
