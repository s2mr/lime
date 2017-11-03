//
//  ChatRoomListCell.swift
//  lime
//
//  Created by 下村一将 on 2017/10/19.
//  Copyright © 2017 kazu. All rights reserved.
//

import UIKit
import Foundation

class ChatRoomListViewCell: UITableViewCell {
	
	@IBOutlet weak var userIconImageView: UIImageView!
	@IBOutlet weak var userNameLabel: UILabel!
	@IBOutlet weak var currentTextLabel: UILabel!
	@IBOutlet weak var dateLabel: UILabel!
	
	override func awakeFromNib() {
		currentTextLabel.textColor = UIColor(displayP3Red: 132/255, green: 140/255, blue: 152/255, alpha: 1)
		dateLabel.textColor = UIColor(displayP3Red: 184/255, green: 189/255, blue: 199/255, alpha: 1)
	}
	
	func updateCell(_ chatRoom: ChatRoomListViewModel) {
		self.userNameLabel?.text = chatRoom.userScreenName
		self.currentTextLabel.text = chatRoom.currentText
		self.dateLabel.text = chatRoom.date
	}
}
