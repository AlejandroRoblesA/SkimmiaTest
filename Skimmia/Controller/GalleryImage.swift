//
//  GalleryImage.swift
//  Skimmia
//
//  Created by Alejandro Robles on 26/01/21.
//

import UIKit

class GalleryImage: UIViewController, UIScrollViewDelegate  {

    var images: [String]?
    var frame = CGRect(x:0, y:0, width: 0, height: 0)
    var index: Int?
    
    lazy var pageControl: UIPageControl = {
        let page = UIPageControl()
        page.translatesAutoresizingMaskIntoConstraints = false
        page.currentPageIndicatorTintColor = .white
        page.pageIndicatorTintColor = .blue
        page.backgroundColor = .black
        return page
    }()
    
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView(frame: CGRect(x: 0, y: (sizeScreen.height/2)-(sizeScreen.width/2), width: sizeScreen.width, height: sizeScreen.width))
        
        scroll.isPagingEnabled = true
        return scroll
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barTintColor = .clear
        
        setupView()
        
        print("\(index!)")
        
        
        for index in 0..<images!.count {
            print(index)
            frame.origin.x = scrollView.frame.size.width * CGFloat(index)
            frame.size = scrollView.frame.size
            print(frame)
            let imageView = UIImageView(frame: frame)
            imageView.contentMode = .scaleAspectFit
            imageView.image = UIImage(named: images![index])//Aqui
            self.scrollView.addSubview(imageView)
        }
        
        scrollView.contentSize = CGSize(width: (scrollView.frame.size.width * CGFloat(images!.count)), height: sizeScreen.width)
        
        scrollView.delegate = self
    }
    
    
    func setupView(){
        
        view.addSubview(scrollView)
        view.addSubview(pageControl)
        
        NSLayoutConstraint.activate(
        [
            pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            pageControl.leftAnchor.constraint(equalTo: view.leftAnchor),
            pageControl.rightAnchor.constraint(equalTo: view.rightAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        pageControl.currentPage = Int(pageNumber)
    }
}
