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
	func viewWillDisappear()
	func callButtonTapped()
	func setStream(local: SKWVideo, remote: SKWVideo)
}

class ChatRoomUseCaseImpl: ChatRoomUseCase {
	private let chatRoomRepository: ChatRoomRepository
	private let accountRepository: AccountRepository
	var audioPlayerInstance: AVAudioPlayer?
	
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
	}
	
	func loadChatRoom(index: Int) -> Observable<ChatRoomModel> {
		return chatRoomRepository.getChatRoom(index: index)
			.map(translator: ChatRoomTranslator())
	}
	
	func sendChat(chat: ChatEntity) -> Observable<ChatRoomModel> {
		playSendSound()
		
//		return chatRoomRepository.getChatRoom(index: 0)
//			.map(translator: ChatRoomTranslator())
		
		return chatRoomRepository.sendChat(chat: chat)
			.map(translator: ChatRoomTranslator())
	}
	
	func getAccountInfo() -> Observable<AccountEntity> {
		return accountRepository.getAccountInfo()
	}
	
	func viewWillDisappear() {
		chatRoomRepository.viewWillDissapear()
	}
	
	func callButtonTapped() {
		chatRoomRepository.callButtonTapped()
	}
	
	func setStream(local: SKWVideo, remote: SKWVideo) {
		chatRoomRepository.setStream(local: local, remote: remote)
	}
}

extension ChatRoomUseCaseImpl {
	private func playSendSound() {
		audioPlayerInstance?.play()
	}
}
