//
//  MessageCell.swift
//  FireChat
//
//  Created by Oscar Rodriguez Garrucho on 26/11/20.
//  Copyright © 2020 Little Monster. All rights reserved.
//

import UIKit

class MessageCell: UICollectionViewCell {

    // MARK: - Properties

    var message: Message? {
        didSet { configure() }
    }

    var bubbleLeftAnchor: NSLayoutConstraint!
    var bubbleRightAnchor: NSLayoutConstraint!

    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.backgroundColor = .lightGray
        return iv
    }()

    private let textView: UITextView = {
        let tv = UITextView()
        tv.backgroundColor = .clear
        tv.font = UIFont.systemFont(ofSize: 16)
        tv.isScrollEnabled = false
        tv.isEditable = false
        tv.textColor = .white
        tv.text = "Some text message for now..."
        return tv
    }()

    private let bubbleContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .systemPurple
        return view
    }()

    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(profileImageView)
        profileImageView.anchor(left: leftAnchor,
                                bottom: bottomAnchor,
                                paddingLeft: 8,
                                paddingBottom: -4)
        profileImageView.setDimensions(height: 32, width: 32)
        profileImageView.layer.cornerRadius = 32 / 2

        addSubview(bubbleContainer)
        bubbleContainer.anchor(top: topAnchor)
        bubbleContainer.widthAnchor.constraint(lessThanOrEqualToConstant: 250).isActive = true
        bubbleContainer.layer.cornerRadius = 12
        bubbleLeftAnchor = bubbleContainer.leftAnchor.constraint(equalTo: profileImageView.rightAnchor,
                                                                 constant: 12)
        bubbleLeftAnchor.isActive = false
        bubbleRightAnchor = bubbleContainer.rightAnchor.constraint(equalTo: rightAnchor, constant: -12)
        bubbleRightAnchor.isActive = false

        bubbleContainer.addSubview(textView)
        textView.anchor(top: bubbleContainer.topAnchor,
                        left: bubbleContainer.leftAnchor,
                        bottom: bubbleContainer.bottomAnchor,
                        right: bubbleContainer.rightAnchor,
                        paddingTop: 4,
                        paddingLeft: 12,
                        paddingBottom: 4,
                        paddingRight: 12)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers

    private func configure() {
        guard let message = message else { return }
        let viewModel = MessageViewModel(message: message)

        bubbleContainer.backgroundColor = viewModel.messageBackgroundColor
        bubbleLeftAnchor.isActive = viewModel.leftAnchorActive
        bubbleRightAnchor.isActive = viewModel.rightAnchorActive

        textView.textColor = viewModel.messageTextColor
        textView.text = message.text
        
        profileImageView.isHidden = viewModel.shouldHideProfileImage
        profileImageView.sd_setImage(with: viewModel.porfileImageUrl)
    }
}
