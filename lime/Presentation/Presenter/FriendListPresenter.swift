//
//  FriendListPresenter.swift
//  lime
//
//  Created by 下村一将 on 2017/10/17.
//  Copyright © 2017 kazu. All rights reserved.
//

import Foundation
import RxSwift

protocol FriendListPresenter {
	func loadFriendList()
}

class FriendListPresenterImpl: FriendListPresenter {
	
	weak var viewInput: FriendListViewInput? // なんでこれだけ宣言違うんだ
	let wireframe: FriendListWireframe
	let useCase: FriendListUseCase
	
	fileprivate let disposeBag = DisposeBag()
	
	public required init(viewInput: FriendListViewInput, wireframe: FriendListWireframe, useCase: FriendListUseCase) {
		self.viewInput = viewInput
		self.useCase = useCase
		self.wireframe = wireframe
	}
	
	func loadFriendList() {
		useCase.loadFriendList()
			.subscribe(
				onNext: { [weak self] friendList in
					self?.loadedFriendListModel(friendList: friendList)
				},
				onError: { error in
					NSLog("Error")
				},
				onCompleted: nil,
				onDisposed: nil)
			.disposed(by: disposeBag)
	}
}

extension FriendListPresenterImpl {
	fileprivate func loadedFriendListModel(friendList: FriendListModel) {
		DispatchQueue.main.async { [weak self] in
			self?.viewInput?.setFriendListModel(friendList)
			//TODO:
		}
	}
	
	//TODO: ErrorHandling
}
