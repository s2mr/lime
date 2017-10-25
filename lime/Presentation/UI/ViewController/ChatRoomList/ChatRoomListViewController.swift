//
//  ChatRoomListViewController.swift
//  lime
//
//  Created by 下村一将 on 2017/10/19.
//  Copyright © 2017 kazu. All rights reserved.
//

import UIKit

protocol ChatRoomListViewInput: class {
	func setTalkListModel(_: ChatRoomListModel)
}

class ChatRoomListViewController: UIViewController {
	
	@IBOutlet weak var tableView: UITableView!
	
	var presenter: ChatRoomListPresenter?
	var chatRooms: [ChatRoomViewModel] = [] // Todo: use viewmodel
	
	public func inject(presenter: ChatRoomListPresenter) {
		self.presenter = presenter
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupUI()
		presenter?.loadChatRoomList()
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
}

extension ChatRoomListViewController {
	func setupUI() {
//		tableView.estimatedRowHeight = 120
//		tableView.rowHeight = UITableViewAutomaticDimension
		tableView.rowHeight = 70
	}
}

extension ChatRoomListViewController: UITableViewDataSource {
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return chatRooms.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "ChatRoomList") as! ChatRoomListViewCell
		
		let chatRoom: ChatRoomViewModel = chatRooms[indexPath.row]
		cell.updateCell(chatRoom)
		
		return cell
	}
}

extension ChatRoomListViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		NSLog("\(indexPath)")
		//		let chatRoom
		presenter?.selectCell()
	}
}

extension ChatRoomListViewController: ChatRoomListViewInput {
	func setTalkListModel(_ chatRoomListModel: ChatRoomListModel) {
		self.chatRooms = chatRoomListModel.chatRoomList // TODO: 型あってる？
		self.tableView.reloadData()
	}
	
}
