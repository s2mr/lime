//
//  FriendListWireframe.swift
//  lime
//
//  Created by 下村一将 on 2017/10/17.
//  Copyright © 2017 kazu. All rights reserved.
//

import UIKit

protocol FriendListWireframe: class {
	weak var viewController: FriendListViewController? { get set }
}

class FriendListWireframeImpl: FriendListWireframe {
	weak var viewController: FriendListViewController?
}
