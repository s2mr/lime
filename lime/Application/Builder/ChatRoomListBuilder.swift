//
//  ChatRoomListBuilder.swift
//  lime
//
//  Created by 下村一将 on 2017/10/19.
//  Copyright © 2017 kazu. All rights reserved.
//

import UIKit

struct ChatRoomListBuilder {
	func build() -> UIViewController {
		let wireframe = ChatRoomListWireframeImpl()
		let viewController = UIStoryboard(name: "ChatRoomList", bundle: nil).instantiateInitialViewController() as! ChatRoomListViewController
		
		let useCase = ChatRoomListUseCaseImpl(
			chatRoomListRepository: ChatRoomListRepositoryImpl(
				dataStore: ChatRoomListDataStoreImpl()
			)
		)
		
		let presenter = ChatRoomListPresenterImpl(viewInput: viewController, useCase: useCase, wireframe: wireframe)
		
		viewController.inject(presenter: presenter)
		
		wireframe.viewController = viewController
		
		return viewController
	}
}
