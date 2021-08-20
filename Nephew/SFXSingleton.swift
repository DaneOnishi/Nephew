//
//  SFXSingleton.swift
//  Nephew
//
//  Created by Daniella Onishi on 13/08/21.
//

import Foundation
import AVFoundation

class SFXMusicSingleton {
    static let shared = SFXMusicSingleton()
    fileprivate var currentPlayer: AVAudioPlayer?
    
    
    fileprivate func playMusic(named name: String, with fileExtension: String, number loops: Int) {
        
        
        let url: URL = Bundle.main.url(forResource: name, withExtension: fileExtension)!
        let player = try! AVAudioPlayer(contentsOf: url, fileTypeHint: nil)
        
        player.numberOfLoops = loops
        player.prepareToPlay()
        player.volume = 0.3
        player.play()
        
        self.currentPlayer = player
    }
    
    func playMainMusic() {
        playMusic(named: "Luminare By HeatleyBros (Loop)", with: ".mp3", number: 3)
        
    }
    
    func soundPopPops() {
        playMusic(named: "PopSound", with: "mp3", number: 0)
    }
}
