//
//  Translator.swift
//  lime
//
//  Created by 下村一将 on 2017/10/18.
//  Copyright © 2017 kazu. All rights reserved.
//

import Foundation
import RxSwift

public protocol Translator {
	associatedtype Input
	associatedtype Output
	func translate(_: Input) throws -> Output
}

// TODO: あとで理解する
// 多分自分で定義した型をObservableにするメソッド
public extension ObservableType {
	public func map<T: Translator>(translator: T) -> Observable<T.Output> where Self.E == T.Input {
		return map { try translator.translate($0) }
	}
}

extension Collection {
	public func map<T: Translator>(translator: T) throws -> [T.Output] where Self.Iterator.Element == T.Input {
		return try map { try translator.translate($0) }
	}
}
