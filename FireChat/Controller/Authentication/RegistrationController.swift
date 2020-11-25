//
//  RegistrationController.swift
//  FireChat
//
//  Created by Oscar Rodriguez Garrucho on 24/11/20.
//

import UIKit

class RegistrationController: UIViewController {

    // MARK: - Properties

    private var viewModel = RegistrationViewModel()

    private let imagePicker = UIImagePickerController()
    private var profileImage: UIImage?

    private let plusPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "plus_photo"), for: .normal)
        button.tintColor = .white
        button.addTarget(self,
                         action: #selector(handleAddProfilePhoto),
                         for: .touchUpInside)
        return button
    }()

    private lazy var emailContainerView: UIView = {
        return InputContainerView(image: UIImage(systemName: "envelope"),
                                  textField: emailTextField,
                                  height: 24)
    }()

    private lazy var nameContainerView: UIView = {
        return InputContainerView(image: UIImage(systemName: "person"),
                                  textField: nameTextField)
    }()

    private lazy var usernameContainerView: UIView = {
        return InputContainerView(image: UIImage(systemName: "person"),
                                  textField: usernameTextField)
    }()

    private lazy var passwordContainerView: UIView = {
        return InputContainerView(image: UIImage(systemName: "lock"),
                                  textField: passwordTextField)
    }()

    private let emailTextField = CustomTextField(placeholder: "Email")

    private let nameTextField = CustomTextField(placeholder: "Full Name")

    private let usernameTextField = CustomTextField(placeholder: "Username")

    private let passwordTextField: UITextField = {
        let tf = CustomTextField(placeholder: "Password")
        tf.isSecureTextEntry = true
        return tf
    }()

    private let signupButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.setHeight(height: 50)
        button.isEnabled = false
        button.addTarget(self, action: #selector(handleSignup), for: .touchUpInside)
        return button
    }()

    private let alreadyHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        let attTitle = NSMutableAttributedString(string: "Already have an account?  ",
                                                 attributes: [.font: UIFont.systemFont(ofSize: 16),
                                                              .foregroundColor: UIColor.white])
        attTitle.append(NSAttributedString(string: "Log In",
                                           attributes: [.font: UIFont.boldSystemFont(ofSize: 16),
                                                        .foregroundColor: UIColor.white]))
        button.setAttributedTitle(attTitle, for: .normal)
        button.addTarget(self, action: #selector(handleShowLogIn), for: .touchUpInside)
        return button
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureNotificationObservers()
    }

    // MARK: - Selectors

    @objc func handleAddProfilePhoto() {
        present(imagePicker, animated: true, completion: nil)
    }

    @objc func textDidChange(sender: UITextField) {
        if sender == emailTextField {
            viewModel.email = sender.text
        }
        else if sender == nameTextField {
            viewModel.fullName = sender.text
        }
        else if sender == usernameTextField {
            viewModel.username = sender.text
        } else {
            viewModel.password = sender.text
        }

        checkFormStatus()
    }

    @objc func handleShowLogIn() {
        navigationController?.popViewController(animated: true)
    }

    @objc func handleSignup() {

    }

    // MARK: - Helpers

    private func configureUI() {
        imagePicker.delegate = self
        imagePicker.allowsEditing = true

        configureGradientLayer()

        view.addSubview(plusPhotoButton)
        plusPhotoButton.centerX(inView: view)
        plusPhotoButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        plusPhotoButton.setDimensions(height: 200, width: 200)

        let stack = UIStackView(arrangedSubviews: [emailContainerView,
                                                   nameContainerView,
                                                   usernameContainerView,
                                                   passwordContainerView,
                                                   signupButton
                                                   ])
        stack.axis = .vertical
        stack.spacing = 16

        view.addSubview(stack)
        stack.anchor(top: plusPhotoButton.bottomAnchor,
                     left: view.leftAnchor,
                     right: view.rightAnchor,
                     paddingTop: 32,
                     paddingLeft: 32,
                     paddingRight: 32)

        view.addSubview(alreadyHaveAccountButton)
        alreadyHaveAccountButton.anchor(left: view.leftAnchor,
                                     bottom: view.safeAreaLayoutGuide.bottomAnchor,
                                     right: view.rightAnchor,
                                     paddingLeft: 32,
                                     paddingRight: 32)
    }

    private func configureNotificationObservers() {
        emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        nameTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        usernameTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
    
}

// MARK: - UIImagePickerControllerDelegate

extension RegistrationController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let profileImage = info[.editedImage] as? UIImage else { return }

        self.profileImage = profileImage

        plusPhotoButton.setImage(profileImage.withRenderingMode(.alwaysOriginal), for: .normal)
        plusPhotoButton.layer.borderColor = UIColor.white.cgColor
        plusPhotoButton.layer.borderWidth = 3.0
        plusPhotoButton.layer.cornerRadius = 200 / 2
        plusPhotoButton.layer.masksToBounds = true
        plusPhotoButton.imageView?.contentMode = .scaleAspectFill
        plusPhotoButton.imageView?.clipsToBounds = true

        dismiss(animated: true, completion: nil)
    }
}

extension RegistrationController: AuthenticationControllerProtocol {

    func checkFormStatus() {
        signupButton.isEnabled = viewModel.formIsValid
        signupButton.backgroundColor = viewModel.formIsValid ? #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1) : #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
    }
}
