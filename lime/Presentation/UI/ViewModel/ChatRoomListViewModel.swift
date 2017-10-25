//
//  ChatRoomListViewModel.swift
//  lime
//
//  Created by 下村一将 on 2017/10/21.
//  Copyright © 2017 kazu. All rights reserved.
//

import Foundation

protocol ChatRoomViewModel {
	var userScreenName: String { get }
	var date: String { get }
	var currentText: String { get }
}
