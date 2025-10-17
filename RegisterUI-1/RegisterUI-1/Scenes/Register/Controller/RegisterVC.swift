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

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
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
    }
}
