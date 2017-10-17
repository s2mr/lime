//
//  FriendListPresenter.swift
//  lime
//
//  Created by 下村一将 on 2017/10/17.
//  Copyright © 2017 kazu. All rights reserved.
//

import Foundation

protocol FriendListPresenter {
}

class FriendListPresenterImpl: FriendListPresenter {
	
	let wireframe: FriendListWireframe
	
	public required init(wireframe: FriendListWireframe) {
		self.wireframe = wireframe
	}
}
