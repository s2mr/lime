//
//  TalkRoomListViewController.swift
//  lime
//
//  Created by 下村一将 on 2017/10/19.
//  Copyright © 2017 kazu. All rights reserved.
//

import UIKit

protocol TalkRoomListViewInput: class {
	func setTalkListModel(_: TalkRoomListModel)
}

class TalkRoomListViewController: UIViewController {
	
	@IBOutlet weak var tableView: UITableView!
	
	var presenter: TalkRoomListPresenter?
	var talkRooms: [TalkRoomViewModel] = [] // Todo: use viewmodel
	
	public func inject(presenter: TalkRoomListPresenter) {
		self.presenter = presenter
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupUI()
		presenter?.loadTalkRoomList()
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
}

extension TalkRoomListViewController {
	func setupUI() {
	}
}

extension TalkRoomListViewController: UITableViewDataSource {
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return talkRooms.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "TalkRoomList") as! TalkRoomListViewCell
		
		let talkRoom: TalkRoomViewModel = talkRooms[indexPath.row]
		cell.updateCell(talkRoom)
		
		return cell
	}
}

extension TalkRoomListViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		NSLog("\(indexPath)")
		//		let talkRoom
		presenter?.selectCell()
	}
}

extension TalkRoomListViewController: TalkRoomListViewInput {
	func setTalkListModel(_ talkRoomListModel: TalkRoomListModel) {
		self.talkRooms = talkRoomListModel.talkRoomList // TODO: 型あってる？
		self.tableView.reloadData()
	}
	
}
