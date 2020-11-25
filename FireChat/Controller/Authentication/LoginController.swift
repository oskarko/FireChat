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
        return InputContainerView(image: UIImage(systemName: "envelope"),
                                  textField: emailTextField,
                                  height: 24)
    }()

    private lazy var passwordContainerView: UIView = {
        return InputContainerView(image: UIImage(systemName: "lock"),
                                  textField: passwordTextField)
    }()

    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.setHeight(height: 50)
        return button
    }()

    private let emailTextField = CustomTextField(placeholder: "Email")

    private let passwordTextField: UITextField = {
        let tf = CustomTextField(placeholder: "Password")
        tf.isSecureTextEntry = true
        return tf
    }()

    private let dontHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        let attTitle = NSMutableAttributedString(string: "Don't have an account?  ",
                                                 attributes: [.font: UIFont.systemFont(ofSize: 16),
                                                              .foregroundColor: UIColor.white])
        attTitle.append(NSAttributedString(string: "Sign Up",
                                           attributes: [.font: UIFont.boldSystemFont(ofSize: 16),
                                                        .foregroundColor: UIColor.white]))
        button.setAttributedTitle(attTitle, for: .normal)
        button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
        return button
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    // MARK: - Selectors

    @objc func handleShowSignUp() {
        let controller = RegistrationController()
        navigationController?.pushViewController(controller, animated: true)
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

        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.anchor(left: view.leftAnchor,
                                     bottom: view.safeAreaLayoutGuide.bottomAnchor,
                                     right: view.rightAnchor,
                                     paddingLeft: 32,
                                     paddingRight: 32)
    }
    
}
