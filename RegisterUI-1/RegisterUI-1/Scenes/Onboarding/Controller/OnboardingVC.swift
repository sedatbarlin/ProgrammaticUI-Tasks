//
//  OnboardingVC.swift
//  RegisterUI-1
//
//  Created by Sedat on 16.10.2025.
//

import UIKit
import SnapKit

class OnboardingVC: UIViewController {
    
    private lazy var onboardingImageView: UIImageView = {
        let iv = UIImageView(image: .onboarding)
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    private lazy var welcomeTitleLabel: UILabel = {
        let label = UILabel()
        label.text = Strings.welcomeTitle
        label.font = .rubikSemiBold(size: 40)
        label.textColor = .clrMainBlack
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = Strings.subtitleLabel
        label.font = .rubikMedium(size: 14)
        label.textColor = .clrSubtitle
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var continueButton: ContinueButton = {
        let button = ContinueButton()
        button.addTarget(self, action: #selector(continueTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(onboardingImageView)
        onboardingImageView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.65)
        }
        
        view.addSubview(welcomeTitleLabel)
        welcomeTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(onboardingImageView.snp.bottom)
            make.left.equalToSuperview().offset(24)
        }
        
        view.addSubview(subtitleLabel)
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(welcomeTitleLabel.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(24)
        }
        
        view.addSubview(continueButton)
        continueButton.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(24)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.width.equalTo(124)
            make.height.equalTo(36)
        }
    }
    
    @objc private func continueTapped() {
        UserDefaults.standard.set(true, forKey: "hasLaunchedBefore")

        let loginVC = LoginVC()
        self.present(destinationVC: loginVC, slideDirection: .right)
    }
}
