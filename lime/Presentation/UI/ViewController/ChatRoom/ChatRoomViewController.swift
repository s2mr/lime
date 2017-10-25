//
//  ChatRoomViewController.swift
//  lime
//
//  Created by 下村一将 on 2017/10/19.
//  Copyright © 2017 kazu. All rights reserved.
//

import UIKit

class ChatRoomViewController: UIViewController {
	
	@IBOutlet weak var tableView: UITableView!
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

extension ChatRoomViewController {
	func setupUI() {
		tableView.separatorColor = UIColor.clear
//		tableView.estimatedRowHeight = 80
		tableView.rowHeight = 80
		
		tableView.register(UINib(nibName: "YourChatViewCell", bundle: nil), forCellReuseIdentifier: "YourChat")
		tableView.register(UINib(nibName: "MyChatViewCell", bundle: nil), forCellReuseIdentifier: "MyChat")
	}
}

extension ChatRoomViewController: UITableViewDataSource {
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 3
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if indexPath.row%2 == 0 {
			let cell = tableView.dequeueReusableCell(withIdentifier: "YourChat") as! YourChatViewCell
			cell.updateCell(text: "今日もいい天気", time: "12:11")
			return cell
		} else {
			let cell = tableView.dequeueReusableCell(withIdentifier: "MyChat") as! MyChatViewCell
			cell.updateCell(text: "明日もいい天気", time: "13:11", isRead: true)
			return cell
		}
	}
}

extension ChatRoomViewController: UITableViewDelegate {
	
}
