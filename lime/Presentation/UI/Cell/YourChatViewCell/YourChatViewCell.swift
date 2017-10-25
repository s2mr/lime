//
//  YourChatViewCell.swift
//  lime
//
//  Created by 下村一将 on 2017/10/25.
//  Copyright © 2017 kazu. All rights reserved.
//

import UIKit

class YourChatViewCell: UITableViewCell {
	
	@IBOutlet weak var textView: UITextView!
	@IBOutlet weak var timeLabel: UILabel!
	
	
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
	}
	
	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
		
		// Configure the view for the selected state
	}
	
}

extension YourChatViewCell {
	func updateCell(text: String, time: String) {
		self.textView?.text = text
		self.timeLabel?.text = time
	}
}
