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
	func getFriendList() -> Observable<[UserEntity]>
}

struct FriendListDataStoreImpl: FriendListDataStore {
	private let api = LimeAPI()
	let disposeBag = DisposeBag()
	
	func getFriendList() -> Observable<[UserEntity]> {
		let friend = UserEntity(userId: "", screenName: "masa", name: "kazu", statusText: "yeaaah")
		let fl = [friend]
		
		return Observable.create({ (observer) -> Disposable in
			observer.onNext(fl)
			return Disposables.create()
		})
	}
	
	func getUser(id: Int) -> () {
		
		// TODO: どっかでdispose
		api.send(LimeAPI.UserRequest(id: 100))
			.subscribe(onNext: {
				print("onNext")
				print("print response")
				$0.users.forEach({ f in
					print(f.name)
					print(f.screenName)
					print(f.statusText)
					print(f.userId)
				})
			}, onError: {
				print("error", $0)
			}, onCompleted: {
				print("completed")
			}, onDisposed: {
				print("disposed")
			})
	}
}
