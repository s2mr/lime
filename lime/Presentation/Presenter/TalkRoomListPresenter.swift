//
//  TalkRoomListPresenter.swift
//  lime
//
//  Created by 下村一将 on 2017/10/20.
//  Copyright © 2017 kazu. All rights reserved.
//

import Foundation
import RxSwift

protocol TalkRoomListPresenter {
	func selectCell()
	func loadTalkRoomList()
}

class TalkRoomListPresenterImpl: TalkRoomListPresenter {
	
	weak var viewInput: TalkRoomListViewInput?
	let useCase: TalkRoomListUseCase
	let wireframe: TalkRoomListWireframe
	
	fileprivate let disposeBag = DisposeBag()
	
	public required init(viewInput: TalkRoomListViewInput, useCase: TalkRoomListUseCase, wireframe: TalkRoomListWireframe) {
		self.viewInput = viewInput
		self.useCase = useCase
		self.wireframe = wireframe
	}
	
	func selectCell() {
		wireframe.showTalkRoom()
	}
	
	func loadTalkRoomList() {
		useCase.loadTalkRoomList()
			.subscribe(
				onNext: { [weak self] talkRoomListModel in
					NSLog("onNext")
					self?.loadedTalkRoomListModel(talkRoomListModel: talkRoomListModel)
				},
				onError: { [weak self] error in
					NSLog("error")
				},
				onCompleted: nil, onDisposed: nil)
			.disposed(by: disposeBag)
		
		//TODO: status
	}
}

extension TalkRoomListPresenterImpl {
	fileprivate func loadedTalkRoomListModel(talkRoomListModel: TalkRoomListModel) {
		DispatchQueue.main.async {
			self.viewInput?.setTalkListModel(talkRoomListModel)
			// TODO: status change, nodata
		}
	}
}
