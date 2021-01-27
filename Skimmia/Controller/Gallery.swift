//
//  Gallery.swift
//  Skimmia
//
//  Created by Alejandro Robles on 25/01/21.
//

import UIKit

class Gallery: UIViewController {
    
    let images = ["acdcB", "acdcH", "deep", "gunsA", "judas",  "kiss", "kissB", "kissD", "led", "motley", "metallicaK", "motleyG", "motor", "nirvana", "ozzy", "pink", "ride", "scorpions", "twisted", "rammstein", "mega", "ironP", "iron", "epica", "amon"]
    
    let cellIdentifier = "cellIdentifier"
    
    lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: sizeScreen.width/3.5, height: sizeScreen.width/3.5)
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(GalleryCell.self, forCellWithReuseIdentifier: cellIdentifier)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        
        view.backgroundColor = .black
        collectionView.delegate = self
        collectionView.dataSource = self
        
        setupConstraintsCollectionView()
        
    }
    
    func setupNavigationBar(){
        navigationItem.title = "Fotos"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barTintColor = .clear
    }
    
    func setupConstraintsCollectionView(){
        view.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    
}

extension Gallery: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! GalleryCell
        cell.image.image = UIImage(named: images[indexPath.row])
        cell.backgroundColor = .white
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let controller = GalleryImage()
        controller.images = images
        controller.index = indexPath.row
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
}
