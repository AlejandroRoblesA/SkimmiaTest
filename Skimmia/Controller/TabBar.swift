//
//  ViewController.swift
//  Skimmia
//
//  Created by Alejandro Robles on 25/01/21.
//

import UIKit

class TabBar: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let appearance = UITabBarItem.appearance()
        let attributes = [NSAttributedString.Key.font:UIFont(name: "American Typewriter", size: 12)]
        appearance.setTitleTextAttributes(attributes as [NSAttributedString.Key : Any], for: .normal)
        UITabBar.appearance().tintColor = .systemRed
        UITabBar.appearance().barTintColor = .black

        let gallery = UINavigationController(rootViewController:Gallery())
        let galleryImage = imageSFSymbols(name: "photo", isSelected: false)
        let selectedGalleryImage = imageSFSymbols(name: "photo.fill", isSelected: true)
        let itemGallery = UITabBarItem(title: "Galería", image: galleryImage, selectedImage: selectedGalleryImage)
        gallery.tabBarItem = itemGallery
        
        let music = UINavigationController(rootViewController:Music())
        let musicImage = imageSFSymbols(name: "music.note.house", isSelected: false)
        let selectedMusicImage = imageSFSymbols(name: "music.note.house.fill", isSelected: true)
        let itemMusic = UITabBarItem(title: "Música", image: musicImage, selectedImage: selectedMusicImage)
        music.tabBarItem = itemMusic
        
        let profile = UINavigationController(rootViewController: Profile())
        let disSelectedImageP = imageSFSymbols(name: "person.circle", isSelected: false)
        let selectedImageP = imageSFSymbols(name: "person.circle.fill", isSelected: true)
        let itemProfile = UITabBarItem(title: "Perfil", image: disSelectedImageP, selectedImage: selectedImageP)
        profile.tabBarItem = itemProfile
        
        let controllers = [gallery, music, profile]
        self.viewControllers = controllers
    }
    
    func imageSFSymbols(name: String, isSelected: Bool) -> UIImage? {
        let image = UIImage(systemName: name, withConfiguration: UIImage.SymbolConfiguration(weight: .regular))?.withTintColor(isSelected ? .systemRed : .systemGray, renderingMode: .alwaysOriginal)
        return image
    }
    
}

