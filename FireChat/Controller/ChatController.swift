//
//  ChatController.swift
//  FireChat
//
//  Created by Oscar Rodriguez Garrucho on 25/11/20.
//  Copyright © 2020 Little Monster. All rights reserved.
//

import UIKit

private let reuseIdentifier = "MessageCell"

class ChatController: UICollectionViewController {

    // MARK: - Properties

    // The user we're chating with
    private let user: User
    private var messages = [Message]()
    var fromCurrentUser = false

    var viewModel = ChatViewModel()

    private lazy var customInputView: CustomInputAccessoryView = {
        let iv = CustomInputAccessoryView(frame: CGRect(x: 0,
                                                        y: 0,
                                                        width: view.frame.width,
                                                        height: 50))
        iv.delegate = self
        return iv
    }()

    // MARK: - Lifecycle

    init(user: User) {
        self.user = user
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }

    override var inputAccessoryView: UIView? {
        get { return customInputView }
    }

    override var canBecomeFirstResponder: Bool {
        return true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        fetchMessages()
    }

    // MARK: - API

    private func fetchMessages() {
        viewModel.fetchMessages(forUser: user) { [weak self] messages in
            guard let strongSelf = self else { return }

            strongSelf.messages = messages
            strongSelf.collectionView.reloadData()
            strongSelf.collectionView.scrollToItem(at: [0, strongSelf.messages.count - 1],
                                                   at: .bottom,
                                                   animated: true)
        }
    }

    // MARK: - Helpers

    private func configureUI() {
        configureNavigationBar(withTitle: user.username, prefersLargeTitles: false)
        collectionView.backgroundColor = .white

        collectionView.register(MessageCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.alwaysBounceVertical = true
        collectionView.keyboardDismissMode = .interactive
    }
}

extension ChatController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MessageCell
        cell.message = messages[indexPath.row]
        cell.message?.user = user
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension ChatController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 50)
        let estimatedSizeCell = MessageCell(frame: frame)
        estimatedSizeCell.message = messages[indexPath.row]
        estimatedSizeCell.layoutIfNeeded()

        let targetSize = CGSize(width: view.frame.width, height: 1000)
        let estimatedSize = estimatedSizeCell.systemLayoutSizeFitting(targetSize)

        return .init(width: view.frame.width, height: estimatedSize.height)
    }

    // Padding for the collectionView
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 16, left: 0, bottom: 16, right: 0)
    }
}

// MARK: - CustomInputAccessoryViewDelegate

extension ChatController: CustomInputAccessoryViewDelegate {
    func inputView(_ inputView: CustomInputAccessoryView, wantsToSend message: String) {

        viewModel.uploadMessage(message, to: user) { [weak self] error in
            guard let strongSelf = self else { return }

            if let error = error {
                print("DEBUG: Error sending message \(error.localizedDescription)")
                return
            }

            inputView.clearMessageText()
        }
    }
}
