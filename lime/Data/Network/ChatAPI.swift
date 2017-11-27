//
//  ChatAPI.swift
//  lime
//
//  Created by 下村一将 on 2017/11/16.
//  Copyright © 2017 kazu. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire
import Unbox

class ChatAPI {
	let endPoint: URL = URL(string: "https://api.a3rt.recruit-tech.co.jp/talk/v1/smalltalk")!
	
	public func sendChat(chatText: String) -> Observable<String> {
		return Observable.create({ observer in
			Alamofire.request(self.endPoint,
							  method: .post,
							  parameters: ["apikey": Secret.CHAT_API_KEY,
										   "query": chatText],
							  encoding: URLEncoding.methodDependent,
							  headers: nil)
				.responseJSON(completionHandler: { data in
					switch data.result {
					case .success(let value):
						if let json = value as? UnboxableDictionary {
							let unboxer = Unboxer(dictionary: json)
							do {
								let dic: Array<Dictionary<String, String>> =  try unboxer.unbox(key: "results")
								observer.onNext(dic[0]["reply"] ?? "")
							} catch {
								observer.onNext("エラー")
							}
						}
					case .failure(let error):
						observer.onNext(error.localizedDescription)
					}
				})
			
			return Disposables.create()
		})
	}
}
