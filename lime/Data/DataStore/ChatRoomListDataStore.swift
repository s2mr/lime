//
//  ChatRoomListDataStore.swift
//  lime
//
//  Created by 下村一将 on 2017/10/21.
//  Copyright © 2017 kazu. All rights reserved.
//

import RxSwift

public protocol ChatRoomListDataStore {
	func getChatRoomList() -> Observable<[ChatRoomEntity]>
}

struct ChatRoomListDataStoreImpl: ChatRoomListDataStore {
	
	fileprivate let api = LimeAPI()
	
	// TODO: get by user
	func getChatRoomList() -> Observable<[ChatRoomEntity]> {
//		let friend = UserEntity(userId: "", screenName: "screenName1", name: "name", statusText: "hogee")
//		let chat1 = ChatEntity(text: "text1", time: "time", userType: .You)
//		let chat2 = ChatEntity(text: "text2", time: "time", userType: .You)
//		let chat3 = ChatEntity(text: "text3", time: "time", userType: .You)
//		let chatRoom = ChatRoomEntity(friend: friend, currentText: "最近眠い", chats: [chat1,chat2,chat3])
//		let friend1 = UserEntity(userId: "", screenName: "screenName2", name: "name", statusText: "RadWimps")
//		let chatRoom1 = ChatRoomEntity(friend: friend1, currentText: "最近眠い", chats: [chat1,chat2,chat3])
//		let tr = [chatRoom, chatRoom1]
		
		return api.send(LimeAPI.ChatRoomsRequest())
			.map{$0.chatRooms}
	}
	
	
}

