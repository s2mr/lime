//
//  FriendListDataStore.swift
//  lime
//
//  Created by 下村一将 on 2017/10/18.
//  Copyright © 2017 kazu. All rights reserved.
//

import Foundation
import RxSwift

public protocol FriendListDataStore {
	// FIXME: use User
	func getFriendList() -> Observable<[FriendEntity]>
}

struct FriendListDataStoreImpl: FriendListDataStore {
	func getFriendList() -> Observable<[FriendEntity]> {
		let friend = FriendEntity(userId: "", screenName: "masa", name: "kazu")
		let fl = [friend]
		
		return Observable.create({ (observer) -> Disposable in
			observer.onNext(fl)
			return Disposables.create()
		})
	}
	
	
}
