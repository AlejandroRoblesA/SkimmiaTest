//
//  AlbumCell.swift
//  Skimmia
//
//  Created by Alejandro Robles on 25/01/21.
//

import UIKit

class AlbumCell: UITableViewCell {
    
    let albumImage: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 50
        image.clipsToBounds = true
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.white.cgColor
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let artistLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.font = UIFont(name: "American Typewriter", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let albumLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont(name: "American Typewriter", size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let songLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "American Typewriter", size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .clear
        self.selectionStyle = .none
        
        self.addSubview(albumImage)
        albumImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        albumImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        albumImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        albumImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        
        self.addSubview(artistLabel)
        artistLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        artistLabel.leadingAnchor.constraint(equalTo: albumImage.trailingAnchor, constant: 10).isActive = true
        artistLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        artistLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        self.addSubview(albumLabel)
        albumLabel.topAnchor.constraint(equalTo: artistLabel.bottomAnchor, constant: 5).isActive = true
        albumLabel.leadingAnchor.constraint(equalTo: albumImage.trailingAnchor, constant: 10).isActive = true
        albumLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        albumLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        self.addSubview(songLabel)
        songLabel.topAnchor.constraint(equalTo: albumLabel.bottomAnchor, constant: 5).isActive = true
        songLabel.leadingAnchor.constraint(equalTo: albumImage.trailingAnchor, constant: 10).isActive = true
        songLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        songLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        self.bottomAnchor.constraint(equalTo: albumImage.bottomAnchor, constant: 10).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
