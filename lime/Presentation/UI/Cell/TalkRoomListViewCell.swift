//
//  TalkRoomListCell.swift
//  lime
//
//  Created by 下村一将 on 2017/10/19.
//  Copyright © 2017 kazu. All rights reserved.
//

import UIKit
import Foundation

class TalkRoomListViewCell: UITableViewCell {
	
	func updateCell(_ talkRoom: TalkRoomViewModel) {
		self.textLabel?.text = talkRoom.userScreenName
		self.detailTextLabel?.text = talkRoom.userScreenName
	}
}
