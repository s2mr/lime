//
//  TalkRoomWireframe.swift
//  lime
//
//  Created by 下村一将 on 2017/10/19.
//  Copyright © 2017 kazu. All rights reserved.
//

import Foundation

protocol TalkRoomWireframe: class {
	weak var viewController: TalkRoomViewController? { get set }
}

class TalkRoomWireframeImpl: TalkRoomWireframe {
	var viewController: TalkRoomViewController?
	
	
}
