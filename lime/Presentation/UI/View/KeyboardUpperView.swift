//
//  KeyboardUpperView.swift
//  lime
//
//  Created by 下村一将 on 2017/10/30.
//  Copyright © 2017 kazu. All rights reserved.
//

import UIKit

class KeyboardUpperView: UIView {
	
	@IBOutlet weak var chatTextField: UITextField!
	@IBOutlet weak var sendButton: UIButton!
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		self.setFromXib()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.setFromXib()
	}
	
	func setFromXib() {
		let nib = UINib.init(nibName: "KeyboardUpperView", bundle: nil)
		let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
		self.addSubview(view)
	}
	
	/*
	// Only override draw() if you perform custom drawing.
	// An empty implementation adversely affects performance during animation.
	override func draw(_ rect: CGRect) {
	// Drawing code
	}
	*/
	
}
