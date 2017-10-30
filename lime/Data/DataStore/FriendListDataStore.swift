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
//		struct Url: URLConvertible {
//			var url: String
//			func asURL() throws -> URL {
//				return URL(string: url)!
//			}
//		}
//
//		let url = Url(url: "https://lime-server-stg.herokuapp.com/v1/users")
		
		api.send(LimeAPI.UserRequest(id: 100))
		
		
		
	}
	
	
}
