//
//  ChatRoomUseCase.swift
//  lime
//
//  Created by 下村一将 on 2017/10/26.
//  Copyright © 2017 kazu. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import AVFoundation
import SkyWay

protocol ChatRoomUseCase {
	func loadChatRoom(index: Int) -> Observable<ChatRoomModel>
	func sendChat(chat: ChatEntity) -> Observable<ChatRoomModel>
	func getAccountInfo() -> Observable<AccountEntity>
}

class ChatRoomUseCaseImpl: ChatRoomUseCase {
	private let chatRoomRepository: ChatRoomRepository
	private let accountRepository: AccountRepository
	var audioPlayerInstance: AVAudioPlayer?

	var peer: SKWPeer?
	var dataConnection: SKWDataConnection?
	
	var strOwnId: String?
	var bConnected: Bool = false
	
	public init(chatRoomRepository: ChatRoomRepository, accountRepository: AccountRepository) {
		self.chatRoomRepository = chatRoomRepository
		self.accountRepository = accountRepository
		
		// サウンドファイルのパスを生成
		let soundFilePath = Bundle.main.path(forResource: "send", ofType: "m4a")!
		let sound:URL = URL(fileURLWithPath: soundFilePath)
		// AVAudioPlayerのインスタンスを作成
		do {
			audioPlayerInstance = try AVAudioPlayer(contentsOf: sound, fileTypeHint:nil)
		} catch {
			print("AVAudioPlayerインスタンス作成失敗")
		}
		// バッファに保持していつでも再生できるようにする
		audioPlayerInstance?.prepareToPlay()
		
		setupSkyWay()
	}
	
	func loadChatRoom(index: Int) -> Observable<ChatRoomModel> {
		return chatRoomRepository.getChatRoom(index: index)
			.map(translator: ChatRoomTranslator())
	}
	
	func sendChat(chat: ChatEntity) -> Observable<ChatRoomModel> {
		playSendSound()
		let res = dataConnection?.send(chat.text as NSObject)
		if res! {
			print("SEND")
		} else {
			print("NOT SEND")
		}
		
		return chatRoomRepository.sendChat(chat: chat)
			.map(translator: ChatRoomTranslator())
	}
	
	func getAccountInfo() -> Observable<AccountEntity> {
		return accountRepository.getAccountInfo()
	}
}

extension ChatRoomUseCaseImpl {
	private func playSendSound() {
		audioPlayerInstance?.play()
	}
	
	private func setupSkyWay() {
		let option = SKWPeerOption()
		option.key = Secret.SKYWAY_API_KEY
		option.domain = Secret.SKYWAY_DOMAIN
		peer = SKWPeer(id: nil, options: option)
		
		peer?.on(.PEER_EVENT_OPEN, callback: { id in
			self.strOwnId = String(describing: id)
			
			// 自分以外のピアと接続
			self.peer?.listAllPeers({ arr in
				let arr = arr! as! [String]
				for id in arr {
					if id != self.strOwnId! {
						let option = SKWConnectOption()
						option.serialization = .SERIALIZATION_BINARY
						self.dataConnection =  self.peer?.connect(withId: id, options: option)
						self.setDataCallBacks()
					}
				}
			})
		})
		
		peer?.on(.PEER_EVENT_CONNECTION, callback: { obj in
			guard let _ = obj else { return	}
			if obj!.isKind(of: SKWDataConnection.self) {
				self.dataConnection = obj! as? SKWDataConnection
				self.setDataCallBacks()
			}
		})
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
		
		self.dataConnection?.on(.DATACONNECTION_EVENT_DATA, callback: { obj in
			dump(obj)
		})
	}
}
