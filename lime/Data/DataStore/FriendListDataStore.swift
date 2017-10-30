//
//  FriendListDataStore.swift
//  lime
//
//  Created by 下村一将 on 2017/10/18.
//  Copyright © 2017 kazu. All rights reserved.
//

import RxSwift
import Alamofire

public protocol FriendListDataStore {
	// FIXME: use User
	func getFriendList() -> Observable<[FriendEntity]>
}

struct FriendListDataStoreImpl: FriendListDataStore {
	private let api = LimeAPI()
	
	func getFriendList() -> Observable<[FriendEntity]> {
		let friend = FriendEntity(userId: "", screenName: "masa", name: "kazu", statusText: "yeaaah")
		let fl = [friend]
		
		return Observable.create({ (observer) -> Disposable in
			observer.onNext(fl)
			return Disposables.create()
		})
	}
	
	func getUser(id: Int) -> () {
		let disposeBag = DisposeBag()
		api.send(LimeAPI.UserRequest(id: 100)).subscribe(onNext: {
			print("onNext")
			print($0)
		}, onError: nil, onCompleted: nil, onDisposed: nil)
		.disposed(by: disposeBag)
	}
	
	
}
