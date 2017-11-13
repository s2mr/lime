//
//  AccountRepository.swift
//  lime
//
//  Created by 下村一将 on 2017/11/13.
//  Copyright © 2017年 kazu. All rights reserved.
//

import Foundation
import RxSwift

public protocol AccountRepository {
	func getAccountInfo() -> Observable<AccountEntity>
}

public struct AccountRepositoryImpl: AccountRepository {
	
	public func getAccountInfo() -> Observable<AccountEntity> {
		return  AccountDataStoreImpl.shared.getAccountInfo()
	}
}
