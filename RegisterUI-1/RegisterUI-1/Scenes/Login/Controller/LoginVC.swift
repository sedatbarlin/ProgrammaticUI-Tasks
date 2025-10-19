//
//  LoginVC.swift
//  RegisterUI-1
//
//  Created by Sedat on 19.10.2025.
//

import UIKit

class LoginVC: UIViewController {
    
    private lazy var loginImageView: UIImageView = {
        let iv = UIImageView(image: .login)
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    private lazy var signInLabel: UILabel = {
        let label = UILabel()
        label.text = Strings.signInLabel
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
    private lazy var passwordInput = FormInputView(type: .password)
    
    private lazy var loginButton: MainButton = {
        let button = MainButton(title: Strings.loginLabel)
        button.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var switchButton: DualTextButton = {
        let button = DualTextButton(mainText: Strings.dontHaveAnAccount, actionText: Strings.signUpLabel)
        button.addTarget(self, action: #selector(dontHaveAccountTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        hideKeyboardWhenTappedAround()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(loginImageView)
        loginImageView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
        }
        
        view.addSubview(signInLabel)
        signInLabel.snp.makeConstraints { make in
            make.top.equalTo(loginImageView.snp.bottom).offset(-56)
            make.left.equalToSuperview().offset(24)
        }
        
        view.addSubview(indicatorView)
        indicatorView.snp.makeConstraints { make in
            make.top.equalTo(signInLabel.snp.bottom).offset(8)
            make.left.equalTo(signInLabel)
            make.width.equalTo(74)
            make.height.equalTo(3)
        }
        
        view.addSubview(emailInput)
        emailInput.snp.makeConstraints { make in
            make.top.equalTo(indicatorView.snp.bottom).offset(35)
            make.left.right.equalToSuperview().inset(25)
            make.height.equalTo(62)
        }
        
        view.addSubview(passwordInput)
        passwordInput.snp.makeConstraints { make in
            make.top.equalTo(emailInput.snp.bottom).offset(24)
            make.left.right.equalToSuperview().inset(25)
            make.height.equalTo(62)
        }
        
        view.addSubview(switchButton)
        switchButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-16)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.bottom.equalTo(switchButton.snp.top).offset(-20)
            make.left.right.equalToSuperview().inset(25)
            make.height.equalTo(50)
        }
    }
    
    @objc private func loginTapped() {
        print("login tapped")
    }
    
    @objc private func dontHaveAccountTapped() {
        let registerVC = RegisterVC()
        self.present(destinationVC: registerVC, slideDirection: .right)
    }
}
