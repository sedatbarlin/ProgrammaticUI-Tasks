//
//  MainButton.swift
//  RegisterUI-1
//
//  Created by Sedat on 19.10.2025.
//

import UIKit

final class MainButton: UIButton {
    
    init(title: String) {
        super.init(frame: .zero)
        setupUI(title: title)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(title: String) {
        setTitle(title, for: .normal)
        setTitleColor(.white, for: .normal)
        titleLabel?.font = .rubikSemiBold(size: 18)
        
        backgroundColor = .clrMainButton
        layer.cornerRadius = 10
        layer.masksToBounds = true
        
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
