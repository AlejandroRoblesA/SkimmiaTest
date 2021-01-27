//
//  UIViewController+Keyboard.swift
//  Skimmia
//
//  Created by Alejandro Robles on 26/01/21.
//

import UIKit

extension UIViewController{
    
    func hideKeyboardWhenTappedAround() {
        print("Tap")
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
