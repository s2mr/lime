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
	@IBOutlet weak var textViewWidthConstraint: NSLayoutConstraint!
	
	override func awakeFromNib() {
		super.awakeFromNib()
		self.backgroundColor = UIColor.clear
		self.textView.layer.cornerRadius = 15
		
		self.addSubview(YourBalloonView(frame: CGRect(x: textView.frame.minX-10, y: textView.frame.minY-10, width: 50, height: 50)))
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
		
		let frame = CGSize(width: self.frame.width, height: CGFloat.greatestFiniteMagnitude)
		let rect = self.textView.sizeThatFits(frame)
		textViewWidthConstraint.constant = rect.width
	}
}
