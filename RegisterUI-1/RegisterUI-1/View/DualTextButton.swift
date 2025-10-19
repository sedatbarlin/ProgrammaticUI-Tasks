//
//  DualTextButton.swift
//  RegisterUI-1
//
//  Created by Sedat on 19.10.2025.
//

import UIKit

final class DualTextButton: UIButton {
    
    private let mainText: String
    private let actionText: String
    
    init(mainText: String, actionText: String) {
        self.mainText = mainText
        self.actionText = actionText
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        let normalText = NSMutableAttributedString(
            string: "\(mainText) ",
            attributes: [
                .foregroundColor: UIColor.clrSecondaryTitle,
                .font: UIFont.rubikRegular(size: 14)
            ]
        )
        
        let highlightedText = NSAttributedString(
            string: actionText,
            attributes: [
                .foregroundColor: UIColor.clrMainButton,
                .font: UIFont.rubikMedium(size: 14)
            ]
        )
        
        normalText.append(highlightedText)
        setAttributedTitle(normalText, for: .normal)
        
        titleLabel?.textAlignment = .center
        
        addTarget(self, action: #selector(touchDown), for: .touchDown)
        addTarget(self, action: #selector(touchUp), for: [.touchUpInside, .touchCancel, .touchDragExit])
    }
    
    @objc private func touchDown() {
        alpha = 0.7
    }
    
    @objc private func touchUp() {
        UIView.animate(withDuration: 0.1) {
            self.alpha = 1.0
        }
    }
}
