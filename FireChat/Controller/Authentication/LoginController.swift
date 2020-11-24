//
//  LoginController.swift
//  FireChat
//
//  Created by Oscar Rodriguez Garrucho on 24/11/20.
//

import UIKit

class LoginController: UIViewController {

    // MARK: - Properties

    private let iconImage: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "bubble.right")
        iv.tintColor = .white
        return iv
    }()

    private lazy var emailContainerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .clear

        let iv = UIImageView()
        iv.image = UIImage(systemName: "envelope")
        iv.tintColor = .white

        containerView.addSubview(iv)
        iv.centerY(inView: containerView)
        iv.anchor(left: containerView.leftAnchor, paddingLeft: 8)
        iv.setDimensions(height: 24, width: 28)

        containerView.addSubview(emailTextField)
        emailTextField.centerY(inView: containerView)
        emailTextField.anchor(left: iv.rightAnchor,
                              bottom: containerView.bottomAnchor,
                              right: containerView.rightAnchor,
                              paddingLeft: 8,
                              paddingBottom: -8)

        containerView.setHeight(height: 50)
        return containerView
    }()

    private lazy var passwordContainerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .clear

        let iv = UIImageView()
        iv.image = UIImage(systemName: "lock")
        iv.tintColor = .white

        containerView.addSubview(iv)
        iv.centerY(inView: containerView)
        iv.anchor(left: containerView.leftAnchor, paddingLeft: 8)
        iv.setDimensions(height: 28, width: 28)

        containerView.addSubview(passwordTextField)
        passwordTextField.centerY(inView: containerView)
        passwordTextField.anchor(left: iv.rightAnchor,
                              bottom: containerView.bottomAnchor,
                              right: containerView.rightAnchor,
                              paddingLeft: 8,
                              paddingBottom: -8)

        containerView.setHeight(height: 50)
        return containerView
    }()

    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.backgroundColor = .systemRed
        button.setHeight(height: 50)
        return button
    }()

    private let emailTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email"
        tf.textColor = .white
        return tf
    }()

    private let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.textColor = .white
        tf.isSecureTextEntry = true
        return tf
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    // MARK: - Helpers

    private func configureUI() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
        view.backgroundColor = .systemPurple

        configureGradientLayer()

        view.addSubview(iconImage)
        iconImage.centerX(inView: view)
        iconImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        iconImage.setDimensions(height: 120, width: 120)

        let stack = UIStackView(arrangedSubviews: [emailContainerView,
                                                   passwordContainerView,
                                                   loginButton])
        stack.axis = .vertical
        stack.spacing = 16

        view.addSubview(stack)
        stack.anchor(top: iconImage.bottomAnchor,
                     left: view.leftAnchor,
                     right: view.rightAnchor,
                     paddingTop: 32,
                     paddingLeft: 32,
                     paddingRight: 32)
    }

    private func configureGradientLayer() {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemPurple.cgColor, UIColor.systemPink.cgColor]
        gradient.locations = [0, 1]
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
    }
    
}
