//
//  AccountDataStore.swift
//  lime
//
//  Created by 下村一将 on 2017/11/13.
//  Copyright © 2017年 kazu. All rights reserved.
//

import Foundation
import RxSwift

public protocol AccountDataStore {
	func getAccountInfo() -> Observable<AccountEntity>
}

public class AccountDataStoreImpl: AccountDataStore {
	
	static var shared = AccountDataStoreImpl()
	
	private init(){}
	
	public func getAccountInfo() -> Observable<AccountEntity> {
		return Observable.create{ obserber in
			
			let accountEntity = AccountEntity(userId: 10)
			
			obserber.onNext(accountEntity)
			
			return Disposables.create()
		}
	}
}
