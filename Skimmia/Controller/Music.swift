//
//  Music.swift
//  Skimmia
//
//  Created by Alejandro Robles on 25/01/21.
//

import UIKit

class Music: UIViewController {
    
    let cellIdentifier = "cellId"
    let factory = FactorySongs.shared().fillAlbumData()
    
    let tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .clear
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Canciones"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barTintColor = .clear
        
        view.backgroundColor = .black
        tableView.dataSource = self
        tableView.delegate = self
        
        view.addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        tableView.register(AlbumCell.self, forCellReuseIdentifier: cellIdentifier)
    }
}

extension Music: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return factory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! AlbumCell
        
        cell.albumImage.image = UIImage(named:factory[indexPath.row].image)
        cell.artistLabel.text = factory[indexPath.row].artist
        cell.albumLabel.text = factory[indexPath.row].album
        cell.songLabel.text = factory[indexPath.row].song
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = PlaySong()
        controller.index = indexPath.row
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
}
