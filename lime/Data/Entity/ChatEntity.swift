//
//  ChatEntity.swift
//  lime
//
//  Created by 下村一将 on 2017/10/26.
//  Copyright © 2017 kazu. All rights reserved.
//

import Foundation

public struct ChatEntity {
	var text = ""
	var time = ""
	var userType: UserType
	
	public init(text: String, time: String, userType: UserType) {
		self.text = text
		self.time = time
		self.userType = userType
	}
}

public enum UserType {
	case I
	case You
}
