//
//  LoginVC.swift
//  Login&RegisterUI-2
//
//  Created by Sedat on 29.10.2025.
//

import UIKit
import SnapKit

class LoginVC: UIViewController {
    
    private lazy var appLogoImageView: UIImageView = {
        let iv = UIImageView(image: .logo)
        iv.contentMode = .scaleAspectFit
        return iv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI(){
        view.backgroundColor = .clrMainWhite
        
        view.addSubview(appLogoImageView)
        appLogoImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
        }
    }
}
