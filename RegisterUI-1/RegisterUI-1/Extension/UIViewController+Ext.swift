//
//  UIViewController+Ext.swift
//  RegisterUI-1
//
//  Created by Sedat on 17.10.2025.
//

import UIKit
import Hero

//MARK: Hero Page Destination
extension UIViewController {
    public enum Direction {
        case right
        case left
        case up
        case down
    }
    
    public func present(destinationVC: UIViewController, slideDirection: Direction) {
        switch slideDirection {
        case .left:
            destinationVC.hero.modalAnimationType = .selectBy(presenting: .slide(direction: .right), dismissing: .slide(direction: .left))
        case .right:
            destinationVC.hero.modalAnimationType = .selectBy(presenting: .slide(direction: .left), dismissing: .slide(direction: .right))
        case .up:
            destinationVC.hero.modalAnimationType = .selectBy(presenting: .slide(direction: .up), dismissing: .slide(direction: .down))
        case .down:
            destinationVC.hero.modalAnimationType = .selectBy(presenting: .slide(direction: .down), dismissing: .slide(direction: .up))
        }

        destinationVC.isHeroEnabled = true
        destinationVC.modalPresentationStyle = .fullScreen
        self.present(destinationVC, animated: true)
        
    }

    public func presentWithoutAnimation(destinationVC: UIViewController) {
        destinationVC.modalPresentationStyle = .fullScreen
         self.present(destinationVC, animated: false)
    }

    public func presentAsPageSheet(destinationVC: UIViewController) {
        destinationVC.modalPresentationStyle = .pageSheet
         self.present(destinationVC, animated: true)
    }
}

//MARK: Hide Keyboard
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}

//MARK: Hero Pan Gesture
extension UIViewController {
    
    func enableHeroEdgePanDismiss() {
        let edgePan = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(handleHeroEdgePan(_:)))
        edgePan.edges = .left
        view.addGestureRecognizer(edgePan)
    }
    
    @objc private func handleHeroEdgePan(_ gesture: UIScreenEdgePanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        let progress = translation.x / view.bounds.width
        
        switch gesture.state {
        case .began:
            hero.dismissViewController()
        case .changed:
            Hero.shared.update(progress)
        case .ended:
            let velocity = gesture.velocity(in: view).x / view.bounds.width
            if progress + velocity > 0.3 {
                Hero.shared.finish()
            } else {
                Hero.shared.cancel()
            }
        default:
            Hero.shared.cancel()
        }
    }
}
