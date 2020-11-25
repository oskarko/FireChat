//
//  NewMessageController.swift
//  FireChat
//
//  Created by Oscar Rodriguez Garrucho on 25/11/20.
//  Copyright © 2020 Little Monster. All rights reserved.
//

import UIKit

private let reuseIdentifier = "UserCell"

class NewMessageController: UITableViewController {

    // MARK: - Properties

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar(withTitle: "New Message", prefersLargeTitles: false)
        configureUI()
        fetchUsers()
    }

    // MARK: - Helpers

    private func fetchUsers() {
        Service.shared.fetchUsers()
    }

    // MARK: - Selectors

    @objc func handleDismissal() {
        dismiss(animated: true, completion: nil)
    }

    // MARK: - Helpers

    private func configureUI() {
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel,
                                                            target: self,
                                                            action: #selector(handleDismissal))

        tableView.tableFooterView = UIView()
        tableView.register(UserCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 80
    }

}

// MARK: - UITableViewDelegate

extension NewMessageController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
}

// MARK: - UITableViewDataSource

extension NewMessageController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! UserCell

        return cell
    }
}
