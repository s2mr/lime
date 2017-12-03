//
//  ChatRoomViewController.swift
//  lime
//
//  Created by 下村一将 on 2017/10/19.
//  Copyright © 2017 kazu. All rights reserved.
//

import UIKit
import RxSwift
import SkyWay

protocol ChatRoomViewInput: class {
	func setChatRoom(_:ChatRoomModel)
}

class ChatRoomViewController: UIViewController {
	
	fileprivate let disposeBag = DisposeBag()
	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var tableViewButtomConstraint: NSLayoutConstraint!
	
	@IBOutlet weak var remoteView: SKWVideo!
	@IBOutlet weak var localView: SKWVideo!
	
	var bottomView: ChatRoomInputView!
	
	var presenter: ChatRoomPresenter?
	var chats: [ChatEntity] = []
	
	var chatRoomIndex: Int = 0
	
	func inject(presenter: ChatRoomPresenter) {
		self.presenter = presenter
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupUI()
		presenter?.loadChatRoom(index: chatRoomIndex)
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		presenter?.viewWillDisappear()
		self.tabBarController?.tabBar.isHidden = false
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.tabBarController?.tabBar.isHidden = true
	}
	
	override var canBecomeFirstResponder: Bool {
		return true
	}
	
	override var inputAccessoryView: UIView? {
		return bottomView
	}
}

extension ChatRoomViewController {
	func setupUI() {
		tableView.separatorColor = UIColor.clear
		tableView.estimatedRowHeight = 10000
		tableView.rowHeight = UITableViewAutomaticDimension
		tableView.allowsSelection = false
		tableView.keyboardDismissMode = .interactive
		
		tableView.register(UINib(nibName: "YourChatViewCell", bundle: nil), forCellReuseIdentifier: "YourChat")
		tableView.register(UINib(nibName: "MyChatViewCell", bundle: nil), forCellReuseIdentifier: "MyChat")
		
		self.bottomView = ChatRoomInputView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 70))
		self.bottomView.sendButton.rx.tap
			.subscribe(onNext: { [weak self] in
				self?.presenter?.sendMessage(message: (self?.bottomView.chatTextField.text!)!)
			})
			.disposed(by: disposeBag)
		
		let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.backgroundTapped))
		tapRecognizer.cancelsTouchesInView = false // TableViewへタップイベントを流す
		self.tableView.addGestureRecognizer(tapRecognizer)
		
		presenter?.setStream(local: localView, remote: remoteView)
	}
	
	@objc func backgroundTapped() {
		print("backgroundTapped()")
	}
}

extension ChatRoomViewController: UITableViewDataSource {
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.chats.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let chat = self.chats[indexPath.row]
		if chat.isMyChat() {
			let cell = tableView.dequeueReusableCell(withIdentifier: "MyChat") as! MyChatViewCell
			cell.clipsToBounds = true
			// Todo: isRead
			cell.updateCell(text: chat.text, time: chat.time, isRead: true)
			return cell
		} else {
			let cell = tableView.dequeueReusableCell(withIdentifier: "YourChat") as! YourChatViewCell
			cell.clipsToBounds = true
			cell.updateCell(text: chat.text, time: chat.time)
			return cell
		}
	}
}

extension ChatRoomViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		print(indexPath)
	}
	
	func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
		//		self.bottomView.chatTextField.resignFirstResponder()
	}
	
	func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
		return 10
	}
}

extension ChatRoomViewController: ChatRoomViewInput {
	func setChatRoom(_ chatRoomModel: ChatRoomModel) {
		self.chats = chatRoomModel.chats
		self.tableView.reloadData()
	}
}

extension ChatRoomViewController {
	@objc func callButtonTapped() {
		print("callButtonTapped()")
		presenter?.callButtonTapped()
	}
}
