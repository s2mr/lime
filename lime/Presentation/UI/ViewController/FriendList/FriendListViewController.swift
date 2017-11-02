//
//  FriendListViewController.swift
//  lime
//
//  Created by 下村一将 on 2017/10/17.
//  Copyright © 2017 kazu. All rights reserved.
//

import UIKit

// https://qiita.com/shimesaba/items/e0c3ae189ca2b247fa98
// : class をつけることによってprotocolはclassにしか継承できなくなる
protocol FriendListViewInput: class {
	// _ を付けることによって呼び出し時にラベルが要らなくなる、らしい
	// https://qiita.com/mono0926/items/2eb40d58275d20e89ac8
	func setFriendListModel(_: FriendListModel)
}

class FriendListViewController: UIViewController {
	@IBOutlet weak var tableView: UITableView!
	
	var presenter: FriendListPresenter?
	var friendList: [FriendListViewModel] = []
	
	public func inject(presenter: FriendListPresenter) {
		self.presenter = presenter
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupUI()
		presenter?.loadFriendList()
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	
	/*
	// MARK: - Navigation
	
	// In a storyboard-based application, you will often want to do a little preparation before navigation
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
	// Get the new view controller using segue.destinationViewController.
	// Pass the selected object to the new view controller.
	}
	*/
	
}

extension FriendListViewController {
	func setupUI() {
		tableView.register(UINib(nibName: "FriendListViewCell", bundle: nil),
		                   forCellReuseIdentifier: "FriendListViewCell")
		tableView.rowHeight = 70
	}
}

extension FriendListViewController: FriendListViewInput {
	func setFriendListModel(_ friendListModel: FriendListModel) {
		self.friendList = friendListModel.friendList
		tableView.reloadData()
	}
}

extension FriendListViewController: UITableViewDataSource {
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return friendList.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "FriendListViewCell") as! FriendListViewCell
		let friend = friendList[indexPath.row]
		cell.updateCell(friend)
		return cell
	}
}

extension FriendListViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		print(indexPath)
	}
}
