//
//  ChatRoomBuilder.swift
//  lime
//
//  Created by 下村一将 on 2017/10/19.
//  Copyright © 2017 kazu. All rights reserved.
//

import UIKit

struct ChatRoomBuilder {
	func build() -> ChatRoomViewController {
		let wireframe = ChatRoomWireframeImpl()
		let viewController = UIStoryboard(name: "ChatRoom", bundle: nil).instantiateInitialViewController() as! ChatRoomViewController
		
		let useCase = ChatRoomUseCaseImpl(
			chatRoomRepository: ChatRoomRepositoryImpl(
				dataStore: ChatRoomDataStoreImpl()
			),
			accountRepository: AccountRepositoryImpl(),
			chatRepository: ChatRepositoryImpl()
		)
		
		let presenter = ChatRoomPresenterImpl(viewInput: viewController, wireframe: wireframe, useCase: useCase)
		
		viewController.inject(presenter: presenter)
		
		wireframe.viewController = viewController
		
		return viewController
	}
}
