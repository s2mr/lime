//
//  ChatRepository.swift
//  lime
//
//  Created by 下村一将 on 2017/11/29.
//  Copyright © 2017年 kazu. All rights reserved.
//

import Foundation
import SkyWay

protocol ChatRepository {
	func send(_ c: ChatEntity) -> Bool
	func disconnect() -> Bool
	func call()
	func setStream(local: SKWVideo, remote: SKWVideo)
}

class ChatRepositoryImpl: ChatRepository {
	var peer: SKWPeer
	var dataConnection: SKWDataConnection?
	var localStream: SKWMediaStream?
	var localView: SKWVideo!
	var remoteView: SKWVideo!
	
	var strOwnId: String?
	var bConnected: Bool = false
	
	let chatRoomDataStore: ChatRoomDataStore
	
	init(chatRoomDataStore: ChatRoomDataStore) {
		let option = SKWPeerOption()
		option.key = Secret.SKYWAY_API_KEY
		option.domain = Secret.SKYWAY_DOMAIN
		peer = SKWPeer(id: nil, options: option)!
		self.chatRoomDataStore = chatRoomDataStore
		
		peer.on(.PEER_EVENT_OPEN, callback: { id in
			self.strOwnId = String(describing: id)
			
			let constraints = SKWMediaConstraints()
			constraints.maxWidth = 960
			constraints.maxHeight = 540
			constraints.cameraPosition = .CAMERA_POSITION_FRONT
//			
			SKWNavigator.initialize(self.peer)
			self.localStream = SKWNavigator.getUserMedia(constraints)
			self.localStream?.addVideoRenderer(self.localView, track: 0)
			
			// 自分以外のピアと接続
			self.peer.listAllPeers({ arr in
				let arr = arr! as! [String]
				for id in arr {
					if id != self.strOwnId! {
						let option = SKWConnectOption()
						option.serialization = .SERIALIZATION_BINARY
						self.dataConnection =  self.peer.connect(withId: id, options: option)
						self.setDataCallBacks()
					}
				}
			})
		})
		
		peer.on(.PEER_EVENT_CONNECTION, callback: { obj in
			guard let _ = obj else { return	}
			if obj! is SKWDataConnection {
				self.dataConnection = obj! as? SKWDataConnection
				self.setDataCallBacks()
			}
		})
	}
	
	func setStream(local: SKWVideo, remote: SKWVideo) {
		self.localView = local
		self.remoteView = remote
	}
	
	func disconnect() -> Bool {
		dataConnection?.close()
		self.dataConnection = nil
		let result = peer.disconnect()
		return result
	}
	
	func send(_ c: ChatEntity) -> Bool {
		if let conn = dataConnection {
			let data = NSKeyedArchiver.archivedData(withRootObject: c)
			return conn.send(data as NSData)
		}
		return false
	}
	
	private func setDataCallBacks() {
		guard let _  = self.dataConnection else { return }
		self.dataConnection?.on(.DATACONNECTION_EVENT_OPEN, callback: { obj in
			self.bConnected = true
			
			debugPrint("Connected")
		})
		
		self.dataConnection?.on(.DATACONNECTION_EVENT_CLOSE, callback: { obj in
			self.bConnected = false
			self.dataConnection = nil
			debugPrint("Disconnected")
		})
		
		self.dataConnection?.on(.DATACONNECTION_EVENT_ERROR, callback: { obj in
			debugPrint("Error")
		})
		
		self.dataConnection?.on(.DATACONNECTION_EVENT_DATA, callback: { obj in
			let data = obj as! Data
			let c = NSKeyedUnarchiver.unarchiveObject(with: data) as! ChatEntity
			
			self.chatRoomDataStore.chatRooms.value[self.chatRoomDataStore.index].chats.append(c)
		})
	}
	
	func call() {
//		<#code#>
	}
}
