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
    
    
    fileprivate func playMusic(named name: String, with fileExtension: String) {
        
        currentPlayer?.stop()
        
        let url: URL = Bundle.main.url(forResource: name, withExtension: fileExtension)!
        let player = try! AVAudioPlayer(contentsOf: url, fileTypeHint: nil)
        
        player.numberOfLoops = 1
        player.prepareToPlay()
        player.volume = 0.3
        player.play()
        
        self.currentPlayer = player
    }
    
    func playMainMusic() {
        playMusic(named: "Alien Imposter By HeatleyBros", with: ".mp3")
        
    }
}
