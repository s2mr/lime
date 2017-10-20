//
//  TalkRoomListViewController.swift
//  lime
//
//  Created by 下村一将 on 2017/10/19.
//  Copyright © 2017 kazu. All rights reserved.
//

import UIKit

class TalkRoomListViewController: UIViewController {
	
	@IBOutlet weak var tableView: UITableView!
	
	var presenter: TalkRoomListPresenter?
	
	public func inject(presenter: TalkRoomListPresenter) {
		self.presenter = presenter
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupUI()
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
		return 3
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "TalkRoomList") as! TalkRoomListViewCell
		
		cell.updateCell()
		
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
