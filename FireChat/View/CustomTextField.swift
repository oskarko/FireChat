//
//  CustomTextField.swift
//  FireChat
//
//  Created by Oscar Rodriguez Garrucho on 24/11/20.
//  Copyright © 2020 Little Monster. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {

    init(placeholder: String) {
        super.init(frame: .zero)

        borderStyle = .none
        font = UIFont.systemFont(ofSize: 16)
        autocapitalizationType = .none
        textColor = .white
        keyboardAppearance = .dark
        attributedPlaceholder = NSAttributedString(string: placeholder,
                                                   attributes: [.foregroundColor : UIColor.white])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
