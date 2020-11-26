//
//  ProfileController.swift
//  FireChat
//
//  Created by Oscar Rodriguez Garrucho on 26/11/20.
//  Copyright © 2020 Little Monster. All rights reserved.
//

import Firebase
import UIKit

private let reuseIdentifier = "ProfileCell"

class ProfileController: UITableViewController {

    // MARK: - Properties

    private var viewModel = ProfileViewModel()

    private var user: User? {
        didSet { headerView.user = user }
    }

    private lazy var headerView = ProfileHeader(frame: .init(x: 0, y: 0,
                                                             width: view.frame.width,
                                                             height: 380))

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        fetchUser()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
    }

    // MARK: - Selectors

    // MARK: - API

    private func fetchUser() {
        viewModel.fetchUser() { [weak self] user in
            guard let strongSelf = self else { return }
            strongSelf.user = user
        }
    }
    
    // MARK: - Helpers

    private func configureUI() {
        tableView.backgroundColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.tableHeaderView = headerView
        headerView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.contentInsetAdjustmentBehavior = .never

    }
}

// MARK: - UITableViewDelegate

extension ProfileController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
}

// MARK: - UITableViewDataSource

extension ProfileController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)

        return cell
    }
}

extension ProfileController: ProfileHeaderDelegate {
    func dismissController() {
        dismiss(animated:true, completion: nil)
    }
}
