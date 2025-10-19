//
//  RegisterVC.swift
//  RegisterUI-1
//
//  Created by Sedat on 17.10.2025.
//

import UIKit

class RegisterVC: UIViewController {
    
    private lazy var registerImageView: UIImageView = {
        let iv = UIImageView(image: .register)
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    private lazy var signUpLabel: UILabel = {
        let label = UILabel()
        label.text = Strings.signUpLabel
        label.font = .rubikMedium(size: 38)
        label.textColor = .clrMainBlack
        return label
    }()
    
    private lazy var indicatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .clrMainButton
        view.layer.cornerRadius = 2
        return view
    }()
    
    private lazy var emailInput = FormInputView(type: .email)
    private lazy var phoneInput = FormInputView(type: .phone)
    private lazy var passwordInput = FormInputView(type: .password)
    private lazy var confirmPasswordInput = FormInputView(type: .confirmPassword)
    
    private lazy var createAccountButton: MainButton = {
        let button = MainButton(title: Strings.createAccount)
        button.addTarget(self, action: #selector(creatteAccountTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var switchButton: DualTextButton = {
        let button = DualTextButton(mainText: Strings.haveAnAccount, actionText: Strings.signInLabel)
        button.addTarget(self, action: #selector(haveAccountTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        hideKeyboardWhenTappedAround()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(registerImageView)
        registerImageView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
        }
        
        view.addSubview(signUpLabel)
        signUpLabel.snp.makeConstraints { make in
            make.top.equalTo(registerImageView.snp.bottom).offset(-56)
            make.left.equalToSuperview().offset(24)
        }
        
        view.addSubview(indicatorView)
        indicatorView.snp.makeConstraints { make in
            make.top.equalTo(signUpLabel.snp.bottom).offset(8)
            make.left.equalTo(signUpLabel)
            make.width.equalTo(74)
            make.height.equalTo(3)
        }
        
        view.addSubview(emailInput)
        emailInput.snp.makeConstraints { make in
            make.top.equalTo(indicatorView.snp.bottom).offset(35)
            make.left.right.equalToSuperview().inset(25)
            make.height.equalTo(62)
        }
        
        view.addSubview(phoneInput)
        phoneInput.snp.makeConstraints { make in
            make.top.equalTo(emailInput.snp.bottom).offset(24)
            make.left.right.equalToSuperview().inset(25)
            make.height.equalTo(62)
        }
        
        view.addSubview(passwordInput)
        passwordInput.snp.makeConstraints { make in
            make.top.equalTo(phoneInput.snp.bottom).offset(24)
            make.left.right.equalToSuperview().inset(25)
            make.height.equalTo(62)
        }
        
        view.addSubview(confirmPasswordInput)
        confirmPasswordInput.snp.makeConstraints { make in
            make.top.equalTo(passwordInput.snp.bottom).offset(24)
            make.left.right.equalToSuperview().inset(25)
            make.height.equalTo(62)
        }
        
        view.addSubview(switchButton)
        switchButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-16)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(createAccountButton)
        createAccountButton.snp.makeConstraints { make in
            make.bottom.equalTo(switchButton.snp.top).offset(-20)
            make.left.right.equalToSuperview().inset(25)
            make.height.equalTo(50)
        }
    }
    
    @objc private func creatteAccountTapped() {
        print("create account tapped")
    }
    
    @objc private func haveAccountTapped() {
        print("have account tapped")
    }
}
