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
		let rightButton = UIBarButtonItem(barButtonSystemItem: .camera, target: viewController, action: #selector(viewController.callButtonTapped))
		viewController.navigationItem.setRightBarButton(rightButton, animated: true)
		
		let useCase = ChatRoomUseCaseImpl(
			chatRoomRepository: ChatRoomRepositoryImpl(
				dataStore: ChatRoomDataStoreImpl()
			),
			accountRepository: AccountRepositoryImpl()
		)
		
		let presenter = ChatRoomPresenterImpl(viewInput: viewController, wireframe: wireframe, useCase: useCase)
		
		viewController.inject(presenter: presenter)
		
		wireframe.viewController = viewController
		
		return viewController
	}
}
