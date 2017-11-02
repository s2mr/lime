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
	
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var idLabel: UILabel!
	@IBOutlet weak var statusTextLabel: UILabel!
	
	func updateCell(_ friendListViewModel: FriendListViewModel) {
		nameLabel.text = friendListViewModel.name
		idLabel.text = friendListViewModel.screenName
		statusTextLabel.text = friendListViewModel.statusText
	}
}
