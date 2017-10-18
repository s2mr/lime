//
//  FriendListViewCell.swift
//  lime
//
//  Created by 下村一将 on 2017/10/19.
//  Copyright © 2017 kazu. All rights reserved.
//

import UIKit
import Foundation

class FriendListViewCell: UITableViewCell {
	
	func updateCell(_ timelineModel: FriendListViewModel) {
		self.textLabel?.text = timelineModel.name
		self.detailTextLabel?.text = timelineModel.screenName
	}
}
