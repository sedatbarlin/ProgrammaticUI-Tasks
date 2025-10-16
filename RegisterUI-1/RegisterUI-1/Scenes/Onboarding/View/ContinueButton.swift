//
//  ContinueButton.swift
//  RegisterUI-1
//
//  Created by Sedat on 16.10.2025.
//

import UIKit
import SnapKit

final class ContinueButton: UIButton {
    
    private let buttonTitleLabel: UILabel = {
        let label = UILabel()
        label.text = Strings.continueTitle
        label.font = .rubikMedium(size: 14)
        label.textColor = .clrSecondaryTitle
        return label
    }()
    
    private let iconImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = .continueButton
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .clear
        
        addSubview(buttonTitleLabel)
        buttonTitleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        addSubview(iconImageView)
        iconImageView.snp.makeConstraints { make in
            make.left.equalTo(buttonTitleLabel.snp.right).offset(8)
            make.right.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.height.equalTo(36)
        }
    }
}
