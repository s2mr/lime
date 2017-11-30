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
	
	fileprivate let api = LimeAPI()
	private var accountEntity: Observable<AccountEntity>?
	static var shared = AccountDataStoreImpl()
	
	private init(){}
	
	public func getAccountInfo() -> Observable<AccountEntity> {
		return Observable.create({ observer in
			let ae = AccountEntity(userId: 0, uuid: UIDevice.current.identifierForVendor?.uuidString ?? "")
			observer.onNext(ae)
			return Disposables.create()
		})
	}
}
