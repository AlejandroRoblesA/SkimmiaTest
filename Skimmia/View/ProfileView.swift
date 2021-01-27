//
//  Profile.swift
//  Skimmia
//
//  Created by Alejandro Robles on 25/01/21.
//

import UIKit
import CoreData

class Profile: UIViewController {
    
    //MARK: - Variables
    var dataForm: [Form]?
    
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.contentSize = CGSize(width: sizeScreen.width, height: sizeScreen.height)
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.backgroundColor = .clear
        return scroll
    }()
    
    let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.isUserInteractionEnabled = true
        return view
    }()
    
    lazy var photoUserImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "person.circle", withConfiguration: UIImage.SymbolConfiguration(weight: .regular))?.withTintColor(.white, renderingMode: .alwaysOriginal)
        image.layer.cornerRadius = (sizeScreen.width/3.5)/2
        image.layer.masksToBounds = true
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.borderWidth = 3
        image.backgroundColor = .black
        image.contentMode = .scaleAspectFill
        image.isUserInteractionEnabled = true
        image.gestureRecognizers = [UITapGestureRecognizer(target: self, action: #selector(handleImage))]
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var stackView = UIStackView()
    
    let userNameTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "Nombre", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        textField.layer.borderColor = UIColor.white.cgColor
        textField.textAlignment = .center
        textField.layer.borderWidth = 2
        textField.textColor = .white
        textField.layer.cornerRadius = 20
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let lastNameTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "Apellido", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        textField.layer.borderColor = UIColor.white.cgColor
        textField.textAlignment = .center
        textField.layer.borderWidth = 2
        textField.textColor = .white
        textField.layer.cornerRadius = 20
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let biographyTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 15)
        textView.backgroundColor = .clear
        textView.layer.borderColor = UIColor.white.cgColor
        textView.layer.borderWidth = 2
        textView.textColor = .white
        textView.layer.cornerRadius = 10
        textView.textColor = .white
        textView.isUserInteractionEnabled = true
        textView.text = "Biografía..."
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    //MARK: - Constraints
        func setupConstraints(){
            
            scrollView.backgroundColor = .clear
            
            view.addSubview(scrollView)
            scrollView.topAnchor.constraint(equalTo:    view.topAnchor).isActive    = true
            scrollView.leftAnchor.constraint(equalTo:   view.leftAnchor).isActive   = true
            scrollView.rightAnchor.constraint(equalTo:  view.rightAnchor).isActive  = true
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            
            scrollView.addSubview(contentView)
            contentView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            contentView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
            contentView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            
            mainObjectsConstraints()
        }
        
        func mainObjectsConstraints(){
            
            contentView.addSubview(photoUserImage)
            photoUserImage.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: sizeScreen.height*0.05).isActive = true
            photoUserImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            photoUserImage.widthAnchor.constraint(equalToConstant: sizeScreen.width/3.5).isActive = true
            photoUserImage.heightAnchor.constraint(equalToConstant: sizeScreen.width/3.5).isActive = true
            
            
            setupStackView()
        }
        
        func setupStackView(){
            
            let userNameView = UIView()
            let lastNameView = UIView()
            let biographyView = UIView()
            let emptyView = UIView()
            
            stackView = UIStackView(arrangedSubviews: [userNameView, lastNameView, biographyView, emptyView])
            stackView.axis = .vertical
            stackView.distribution = .fillEqually
            stackView.spacing = 0
            stackView.translatesAutoresizingMaskIntoConstraints = false
            
            contentView.addSubview(stackView)
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            stackView.topAnchor.constraint(equalTo: photoUserImage.bottomAnchor, constant: sizeScreen.height*0.05).isActive = true
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
            stackView.heightAnchor.constraint(equalToConstant: sizeScreen.height/2).isActive = true
            
            //Section One
            userNameView.addSubview(userNameTextField)
            userNameTextField.centerYAnchor.constraint(equalTo: userNameView.centerYAnchor).isActive = true
            userNameTextField.leftAnchor.constraint(equalTo: userNameView.leftAnchor, constant: 40).isActive = true
            userNameTextField.rightAnchor.constraint(equalTo: userNameView.rightAnchor, constant: -40).isActive = true
            userNameTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
            
            //Section Two
            lastNameView.addSubview(lastNameTextField)
            lastNameTextField.centerYAnchor.constraint(equalTo: lastNameView.centerYAnchor).isActive = true
            lastNameTextField.leftAnchor.constraint(equalTo: lastNameView.leftAnchor, constant: 40).isActive = true
            lastNameTextField.rightAnchor.constraint(equalTo: lastNameView.rightAnchor, constant: -40).isActive = true
            lastNameTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
            
            biographyView.addSubview(biographyTextView)
            biographyTextView.topAnchor.constraint(equalTo: biographyView.centerYAnchor, constant: -20).isActive = true
            biographyTextView.leftAnchor.constraint(equalTo: biographyView.leftAnchor, constant: 40).isActive = true
            biographyTextView.rightAnchor.constraint(equalTo: biographyView.rightAnchor, constant: -40).isActive = true
            biographyTextView.bottomAnchor.constraint(equalTo: emptyView.bottomAnchor).isActive = true
            
        }
}
