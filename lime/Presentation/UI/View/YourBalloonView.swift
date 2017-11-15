//
//  YourBalloonView.swift
//  lime
//
//  Created by 下村一将 on 2017/11/15.
//  Copyright © 2017 kazu. All rights reserved.
//

import UIKit

class YourBalloonView: UIView {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		self.backgroundColor = UIColor.clear
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	// Only override draw() if you perform custom drawing.
	// An empty implementation adversely affects performance during animation.
	override func draw(_ rect: CGRect) {
		let line = UIBezierPath()
		UIColor.white.setFill()
		UIColor.clear.setStroke()
		line.move(to: CGPoint(x: 20, y: 15))
		line.addQuadCurve(to: CGPoint(x: 5, y: 5), controlPoint: CGPoint(x: 5, y: 10))
		line.addQuadCurve(to: CGPoint(x: 10, y: 25), controlPoint: CGPoint(x: 0, y: 10))
		line.close()
		line.fill()
		line.stroke()
	}
}
