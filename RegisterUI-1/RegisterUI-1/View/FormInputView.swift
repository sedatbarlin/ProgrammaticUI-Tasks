//
//  FormInputView.swift
//  RegisterUI-1
//
//  Created by Sedat on 18.10.2025.
//

import UIKit
import SnapKit

final class FormInputView: UIView {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .rubikMedium(size: 16)
        label.textColor = .clrSecondaryBlack
        return label
    }()
    
    private lazy var iconImageView: UIImageView = {
        let iv = UIImageView()
        iv.tintColor = .clrSecondaryBlack
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .clrSecondaryBlack
        return view
    }()
    
    private lazy var textField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .none
        tf.textColor = .clrSecondaryBlack
        tf.font = .rubikRegular(size: 14)
        tf.autocorrectionType = .no
        tf.autocapitalizationType = .none
        tf.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        return tf
    }()
    
    private lazy var underlineView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    private lazy var eyeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: Images.eyeSlash), for: .normal)
        button.tintColor = .clrSecondaryBlack
        button.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        return button
    }()
    
    private var isPasswordVisible = false
    private var inputType: FormInputType!
    
    init(type: FormInputType) {
        super.init(frame: .zero)
        self.inputType = type
        setupUI(type: type)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(type: FormInputType) {
        titleLabel.text = type.title
        iconImageView.image = UIImage(systemName: type.iconName)
        textField.placeholder = type.placeholder
        textField.isSecureTextEntry = type.isSecure
        let eyeImageName = type.isSecure ? Images.eyeSlash : Images.eye
        eyeButton.setImage(UIImage(systemName: eyeImageName), for: .normal)
        eyeButton.isHidden = !type.isSecure
        
        [titleLabel, iconImageView, separatorView, textField, eyeButton, underlineView].forEach { addSubview($0) }
        
        titleLabel.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
        }
        
        iconImageView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.left.equalToSuperview()
            make.width.height.equalTo(16)
        }
        
        separatorView.snp.makeConstraints { make in
            make.centerY.equalTo(iconImageView)
            make.left.equalTo(iconImageView.snp.right).offset(8)
            make.width.equalTo(1)
            make.height.equalTo(8)
        }
        
        textField.snp.makeConstraints { make in
            make.centerY.equalTo(iconImageView)
            make.left.equalTo(separatorView.snp.right).offset(8)
            if type.isSecure {
                make.right.equalTo(eyeButton.snp.left).offset(-8)
            } else {
                make.right.equalToSuperview()
            }
            make.height.equalTo(36)
        }
        
        eyeButton.snp.makeConstraints { make in
            make.centerY.equalTo(textField)
            make.right.equalToSuperview()
            make.width.height.equalTo(16)
        }
        
        underlineView.snp.makeConstraints { make in
            make.top.equalTo(iconImageView.snp.bottom).offset(8)
            make.left.right.equalToSuperview()
            make.height.equalTo(1.5)
            make.bottom.equalToSuperview()
        }
    }
    
    var text: String? {
        return textField.text
    }
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        underlineView.backgroundColor = (textField.text?.isEmpty ?? true) ? .lightGray : .clrMainButton
    }
    
    @objc private func togglePasswordVisibility() {
        isPasswordVisible.toggle()
        textField.isSecureTextEntry = !isPasswordVisible
        let imageName = isPasswordVisible ? Images.eye : Images.eyeSlash
        eyeButton.setImage(UIImage(systemName: imageName), for: .normal)
        
        if let existingText = textField.text {
            textField.text = ""
            textField.text = existingText
        }
    }
}
