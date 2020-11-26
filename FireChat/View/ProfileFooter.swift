//
//  ProfileFooter.swift
//  FireChat
//
//  Created by Oscar Rodriguez Garrucho on 26/11/20.
//  Copyright © 2020 Little Monster. All rights reserved.
//

import UIKit

protocol ProfileFooterdelegate: class {
    func handleLogout()
}

class ProfileFooter: UIView {

    // MARK: - Properties

    weak var delegate: ProfileFooterdelegate?

    private lazy var logoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Logout", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = .systemPink
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(handleLogout), for: .touchUpInside)
        return button
    }()

    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Selectors

    @objc func handleLogout() {
        delegate?.handleLogout()
    }

    // MARK: - Helpers

    private func configureUI() {
        addSubview(logoutButton)
        logoutButton.anchor(left: leftAnchor,
                            right: rightAnchor,
                            paddingLeft: 32,
                            paddingRight: 32)
        logoutButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        logoutButton.centerY(inView: self)

    }
}
