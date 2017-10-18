//
//  TalkRoomListViewController.swift
//  lime
//
//  Created by 下村一将 on 2017/10/19.
//  Copyright © 2017 kazu. All rights reserved.
//

import UIKit

class TalkRoomListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		setupUI()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension TalkRoomListViewController {
	func setupUI() {
		self.title = "Chats"
	}
}
