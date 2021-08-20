//
//  SFXSingleton.swift
//  Nephew
//
//  Created by Daniella Onishi on 13/08/21.
//

import Foundation
import AVFoundation

class SFXMusicSingleton: NSObject, AVAudioPlayerDelegate {
    static let shared = SFXMusicSingleton()
    fileprivate var currentPlayer: AVAudioPlayer?
   
    
    private override init() { }

    var players: [URL: AVAudioPlayer] = [:]
    var duplicatePlayers: [AVAudioPlayer] = []

    func playSound(soundFileName: String) {

        guard let bundle = Bundle.main.path(forResource: soundFileName, ofType: "mp3") else { return }
        let soundFileNameURL = URL(fileURLWithPath: bundle)

        if let player = players[soundFileNameURL] {

            if !player.isPlaying {
                player.prepareToPlay()
                player.play()
            } else {

                do {
                    let duplicatePlayer = try AVAudioPlayer(contentsOf: soundFileNameURL)

                    duplicatePlayer.delegate = self
                   
                    duplicatePlayers.append(duplicatePlayer)
                    

                    duplicatePlayer.prepareToPlay()
                    duplicatePlayer.play()
                } catch let error {
                    print(error.localizedDescription)
                }
            }
        } else {
            do {
                let player = try AVAudioPlayer(contentsOf: soundFileNameURL)
                players[soundFileNameURL] = player
                player.prepareToPlay()
                player.play()
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }

    func playMainMusic() {
        playSound(soundFileName: "Luminare By HeatleyBros (Loop)")
    }
    
    func soundPopPops() {
        playSound(soundFileName: "PopSound")
    }
}
