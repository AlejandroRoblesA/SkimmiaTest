//
//  PlaySong.swift
//  Skimmia
//
//  Created by Alejandro Robles on 25/01/21.
//

import UIKit
import AVFoundation

class PlaySong: UIViewController {
    
    var player: AVAudioPlayer?
    let factory = FactorySongs.shared().fillAlbumData()
    var index: Int?
    
    let albumImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let artistLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.textAlignment = .center
        label.font = UIFont(name: "American Typewriter", size: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let albumLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.textAlignment = .center
        label.font = UIFont(name: "American Typewriter", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let songLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "American Typewriter", size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
        
        navigationItem.title = factory[index!].song
        
        music(songName: factory[index!].songId)
        albumImage.image = UIImage(named: factory[index!].image)
        artistLabel.text = factory[index!].artist
        albumLabel.text = factory[index!].album
        songLabel.text = factory[index!].song
        
        setupConstaintsView()
    }
    
    func setupConstaintsView(){
        view.addSubview(albumImage)
        albumImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        albumImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: sizeScreen.height*0.1).isActive = true
        albumImage.heightAnchor.constraint(equalToConstant: sizeScreen.width/2).isActive = true
        albumImage.widthAnchor.constraint(equalToConstant: sizeScreen.width/2).isActive = true
        
        view.addSubview(artistLabel)
        artistLabel.topAnchor.constraint(equalTo: albumImage.bottomAnchor, constant: 30).isActive = true
        artistLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        artistLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        artistLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        view.addSubview(albumLabel)
        albumLabel.topAnchor.constraint(equalTo: artistLabel.bottomAnchor, constant: 15).isActive = true
        albumLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        albumLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        albumLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        view.addSubview(songLabel)
        songLabel.topAnchor.constraint(equalTo: albumLabel.bottomAnchor, constant: 10).isActive = true
        songLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        songLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        songLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    func setupNavigationBar(){
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barTintColor = .clear
    }
    
    func music(songName: String){
        
        let urlString = Bundle.main.path(forResource: songName, ofType: "mp3")
        
        do{
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            guard let urlString = urlString else { return }
            player = try AVAudioPlayer(contentsOf: URL(string: urlString)!)
            guard let player = player else { return }
            player.play()
        }
        catch{
            print("error\(error.localizedDescription)")
        }
    }
}
