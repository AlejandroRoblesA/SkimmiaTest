//
//  UIScroll+Keyboard.swift
//  Skimmia
//
//  Created by Alejandro Robles on 26/01/21.
//

import UIKit

extension UIScrollView{
    //MARK: - Keyboard
    func setupKeyboard(){
        let keyboardWillShow = UIResponder.keyboardWillShowNotification
        let keyboardWillHide = UIResponder.keyboardWillHideNotification
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyBoardWillShow), name: keyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardWillHide), name: keyboardWillHide, object: nil)
    }
    
    @objc func handleKeyBoardWillShow (notification: Notification) {
        guard let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        let keyboardRectangle = keyboardFrame.cgRectValue
        let keyboardHeight = keyboardRectangle.height
        self.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardHeight+20, right: 0)
    }
    
    @objc func handleKeyboardWillHide () {
        self.contentInset = .zero
    }
}
