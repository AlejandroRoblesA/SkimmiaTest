//
//  Songs.swift
//  Skimmia
//
//  Created by Alejandro Robles on 25/01/21.
//

import UIKit

let sizeScreen = UIScreen.main.bounds.size

struct Songs{
    let artist: String
    let album: String
    let song: String
    let songId: String
    let image: String
}

class FactorySongs{
    
    private static var _shared = FactorySongs()
    
    class func shared() -> FactorySongs{
        return _shared
    }
    
    func fillAlbumData() -> [Songs]{
        let highway = Songs(artist: "AC DC",
                            album: "Highway to hell",
                            song: "Highway to hell",
                            songId: "track1",
                            image: "acdcH")
        let back    = Songs(artist: "AC DC",
                            album: "Back in black",
                            song: "Back in black",
                            songId: "track2",
                            image: "acdcB")
        let sweet   = Songs(artist: "Guns and Roses",
                            album: "Appetite for destruction",
                            song: "Sweet child o' mine",
                            songId: "track3",
                            image: "gunsA")
        let i       = Songs(artist: "Kiss",
                            album: "Dynasty",
                            song: "I was made for lovin' you",
                            songId: "track4",
                            image: "kiss")
        let seek    = Songs(artist: "Metallica",
                            album: "Kill 'em all",
                            song: "Seek and destroy",
                            songId: "track5",
                            image: "metallicaK")
        let ace      = Songs(artist: "Motorhead",
                             album: "Ace of spades",
                             song: "Ace of spades",
                             songId: "track6",
                             image: "motor")
        
        return [back, highway, sweet, i, seek, ace]
    }
}


